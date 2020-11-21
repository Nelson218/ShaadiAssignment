//
//  DetailCoordinator.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit
import ShaadiLib

public final class DetailCoordinator: BaseCoOrdinator {
    
    var rootViewController: UIViewController = UIViewController()

    public init(forUser user: User) {
        let detailViewController = DetailViewController()
        detailViewController.user = user
        rootViewController = detailViewController
    }
}
