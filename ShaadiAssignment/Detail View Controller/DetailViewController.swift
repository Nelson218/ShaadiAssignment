//
//  DetailViewController.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit
import ShaadiLib

final internal class DetailViewController: ShaadiTableViewController {
    
    internal var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.name
        
        tableViewData = user.createViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}
