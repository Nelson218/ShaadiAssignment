//
//  ViewController.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 20/11/20.
//

import UIKit
import ShaadiLib

final class ListViewController: ShaadiTableViewController, UIViewControllerFetchProtocol {
    
    internal var userSelected: ((User) -> Void) = { _ in }
    
    private var users = [User]() {
        didSet {
            tableViewData = users.compactMap { ListViewModel(user: $0) }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        fetch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.isHidden = true
    }
    
    func fetch() {
        showLoadingIndicator()
        User.fetch(completionHandler: { [weak self] (users) in
            guard let `self` = self else { return }
            self.hideLoadingIndicator()
            self.users = users
        }) { [weak self] (error) in
            guard let `self` = self else { return }
            self.hideLoadingIndicator()
            self.showError(errorConfig: error)
        }
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewModel = tableViewData[indexPath.row] as? ListViewModel {
            userSelected(viewModel.user)
        }
    }
}

