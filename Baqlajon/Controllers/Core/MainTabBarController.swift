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
        let vc2 = UINavigationController(rootViewController: MyCourses())
        let vc3 = UINavigationController(rootViewController: BalanceVC())
        let vc4 = UINavigationController(rootViewController: ProfileVC())
        
        vc1.title = "Home"
        vc2.title = "My Courses"
        vc3.title = "Balance"
        vc4.title = "Profile"
        
        
        vc1.tabBarItem.image = UIImage(named: "home 1")
        vc2.tabBarItem.image = UIImage(named: "book 1")
        vc3.tabBarItem.image = UIImage(named: "wallet 1")
        vc4.tabBarItem.image = UIImage(named: "profile 1")
        
        tabBar.tintColor = .appColor(color: .mainBlue)
        
        
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .appColor(color: .white)
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
