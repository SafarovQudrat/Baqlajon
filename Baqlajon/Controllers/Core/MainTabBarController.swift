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
        let appDelegate = UIApplication.shared.windows
        print("isDARKKKKKKKKKK =====",cache.bool(forKey: "isDark"))
        if cache.bool(forKey: "isDark") {
            for i in appDelegate {
                i.overrideUserInterfaceStyle = .dark
            }
            return
            
        } else {
            for i in appDelegate {
                i.overrideUserInterfaceStyle = .light
            }
            return
            
        }
        setHomeVC()
        observeLangNotif()
        setLang()
    }
    func setHomeVC(){
        if self.selectedIndex == 0 {
            let vc = HomeVC()
            vc.navigationController?.view.addSubview(vc.backProfileV)
            vc.backProfileV.isHidden = false
        }
    }
    
    
    
    
    
    
    let vc1 = UINavigationController(rootViewController: HomeVC())
    let vc2 = UINavigationController(rootViewController: MyCourses())
    let vc3 = UINavigationController(rootViewController: BalanceVC())
    let vc4 = UINavigationController(rootViewController: ProfileVC())
    
    
    func setUPTabbar() {
        
        
        observeLangNotif()
        setLang()
        
        
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
    
    
    func setLang(){
        vc1.title = Lang.getString(type: .tabBarHome)
        vc2.title = Lang.getString(type: .tabBarCourse)
        vc3.title = Lang.getString(type: .tabBarBalance)
        vc4.title = Lang.getString(type: .tabbarProfile)
    }
    

}
//MARK: - NnotificationCenter for language changing
extension MainTabBarController {
    func observeLangNotif() {
        NotificationCenter.default.addObserver(self, selector: #selector(changLang), name: NSNotification.Name.init(rawValue: "LANGNOTIFICATION"), object: nil)
        print("NotificationCenter StartVC")
    }
    @objc func changLang(_ notification: NSNotification) {
        guard let lang = notification.object as? Int else { return }
        switch lang {
        case 0:
            Cache.save(appLanguage: .uz)
            setLang()
        case 1:
            Cache.save(appLanguage: .ru)
            setLang()
        case 2:
            Cache.save(appLanguage: .en)
            setLang()
        default: break
        }
    }
}
