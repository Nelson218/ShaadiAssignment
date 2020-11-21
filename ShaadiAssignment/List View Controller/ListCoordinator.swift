//
//  ListCoordinator.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 20/11/20.
//

import UIKit
import ShaadiLib

public final class ListCoordinator: BaseCoOrdinator {
    
    var rootViewController: UIViewController = UIViewController()

    public init() {
        let listViewController = ListViewController()
        listViewController.userSelected = userSelected
        let navController = UINavigationController(rootViewController: listViewController)
        navController.modalPresentationStyle = .fullScreen
        rootViewController = navController
    }
    
    private func userSelected(user: User) {
        let detailCoordinator = DetailCoordinator(forUser: user)
        baseViewController.pushViewController(detailCoordinator.rootViewController, animated: true)
    }
}
