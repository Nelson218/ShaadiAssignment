//
//  ShaadiTableView.swift
//  ShaadiLib
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit

open class ShaadiTableViewController: UIViewController {
    public var tableView: UITableView!
    public var tableViewData = [ShaadiViewProtocol]() {
        didSet {
            registerCell()
            tableView.reloadData()
        }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.contentInset = .init(top: 20, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func registerCell() {
        for viewModel in tableViewData {
            tableView.register(UINib(nibName: viewModel.nibName, bundle: nil), forCellReuseIdentifier: viewModel.identifer)
        }
    }
}

extension ShaadiTableViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = tableViewData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.identifer, for: indexPath)
        
        if let cell = cell as? ShaadiTableViewCellProtocol {
            cell.prepare(shaadiViewModel: viewModel)
        }
        
        return cell
    }
}
