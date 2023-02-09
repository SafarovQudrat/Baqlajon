//
//  MainTabBarController.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 09/02/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUPTabbar()
    }
    
    
    
    func setUPTabbar() {
        
        
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: HomeVC())
        let vc3 = UINavigationController(rootViewController: HomeVC())
        let vc4 = UINavigationController(rootViewController: HomeVC())
        
        vc1.title = "Home"
        vc2.title = "My Courses"
        vc3.title = "Balance"
        vc4.title = "Profile"
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "book")
        vc3.tabBarItem.image = UIImage(systemName: "bitcoinsign.square")
        vc4.tabBarItem.image = UIImage(systemName: "person")
        
        tabBar.tintColor = .appColor(color: .mainBlue)
        
        
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .appColor(color: .gray7)
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }

}
