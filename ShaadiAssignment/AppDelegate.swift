//
//  AppDelegate.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 20/11/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var listCoOrdinator: ListCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let listCoordinator = ListCoordinator()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = listCoordinator.rootViewController
        
        return true
    }

}

