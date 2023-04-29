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

        if cache.bool(forKey: "isTabbar") {
            let vc = MainTabBarController()
            window?.rootViewController = vc
        }else{
            let vc = IntroductionPageVC()
            window?.rootViewController = vc
        }
        
            
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "LANGNOTIFICATION"), object: cache.integer(forKey: "lang") , userInfo: nil)
            print("NotificationCenter LanguageVC \(String(describing: cache.integer(forKey: "lang")))")
            
        
        
        window?.makeKeyAndVisible()
        if cache.bool(forKey: "isDark") {
            window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
        return true
    }
}

