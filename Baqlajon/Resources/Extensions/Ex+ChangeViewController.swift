//
//  Ex+ChangeViewController.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit

extension UIApplication {
    static var keyWindow: UIWindow? {
        return shared.windows.first(where: {$0.isKeyWindow})
    }
}

class ChangeRootViewController {
    
    class func change(with vc: UIViewController) {
        guard let window = UIApplication.keyWindow else { return }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.4
        window.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.transition(with: window, duration: duration, options: options, animations: {
            window.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion:{completed in})
    }
}


