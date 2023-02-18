//
//  AppDelegate.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit

@available(iOS 13.4, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UINavigationController(rootViewController: BalanceVC())
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        return true
    }
}

