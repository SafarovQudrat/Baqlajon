//
//  Ex+UIColor.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit

extension UIColor {
    static func appColor(color: Colors) -> UIColor {
        var withcolor = UIColor.white
        switch color {
        case .mainBlue:
            withcolor = UIColor(named: "main blue")!
        case .black1:
            withcolor = UIColor(named: "black 1")!
        case .black2:
            withcolor = UIColor(named: "black 2")!
        case .black3:
            withcolor = UIColor(named: "black 3")!
        case .gray1:
            withcolor = UIColor(named: "gray 1")!
        case .gray2:
            withcolor = UIColor(named: "gray 2")!
        case .gray3:
            withcolor = UIColor(named: "gray 3")!
        case .gray4:
            withcolor = UIColor(named: "gray 4")!
        case .gray5:
            withcolor = UIColor(named: "gray 5")!
        case .gray6:
            withcolor = UIColor(named: "gray 6")!
        case .gray7:
            withcolor = UIColor(named: "gray 7")!
        case .white:
            withcolor = UIColor(named: "white")!
        case .mainPurple:
            withcolor = UIColor(named: "main purple")!
        case .yellow:
            withcolor = UIColor(named: "yellow")!
        case .green:
            withcolor = UIColor(named: "green")!
        case .red:
            withcolor = UIColor(named: "red")!
        case .ellipseBackground:
            withcolor = UIColor(named: "ellipse background")!
        case .ellipseBlue:
            withcolor = UIColor(named: "ellipse blue")!
        case .navyBlue:
            withcolor = UIColor(named: "navy blue")!
        case .background:
            withcolor = UIColor(named: "background")!
        }
        return withcolor 
    }
}

enum Colors {
    case mainBlue
    case black1
    case black2
    case black3
    case gray1
    case gray2
    case gray3
    case gray4
    case gray5
    case gray6
    case gray7
    case white
    case mainPurple
    case yellow
    case green
    case red
    case ellipseBackground
    case ellipseBlue
    case navyBlue
    case background
}





