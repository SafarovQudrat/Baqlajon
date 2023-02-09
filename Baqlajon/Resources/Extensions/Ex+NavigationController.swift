//
//  Ex+NavigationController.swift
//  Baqlajon
//
//  Created by MacBook Pro on 09/02/23.
//

import UIKit

extension UINavigationBar {
    
    func update(backgroundColor: UIColor? = nil, titleColor: UIColor? = nil, font: UIFont? = nil) {
        
        if #available(iOS 15, *) {                        /*--------------    if iOS 15 is available for device    -----------------*/
            
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()    /*--------------    Navigation Bar Background let know for changing    -----------------*/
            
            if let backgroundColor = backgroundColor {    /*--------------    backgroundColor optional opened    -----------------*/
                appearance.backgroundColor = backgroundColor
            }
            
            
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
            
        }else {
            
            barStyle = .blackTranslucent
            if let backgroundColor = backgroundColor {
                barTintColor = backgroundColor
            }
            if let titleColor = titleColor {
                titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
            }
        }
    }
    
}
