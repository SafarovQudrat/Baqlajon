//
//  Ex+UIFont.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit

//MARK: - UIFont - Fonts for Application -
extension UIFont {
    static func appFont(ofSize: CGFloat, weight: FontWeight = .regular) -> UIFont {
        var font = UIFont(name: "Poppins-Regular", size: ofSize)
        switch weight {
            
        case .black:
            font = UIFont(name: "Poppins-Black", size: ofSize)
        case .bold:
            font = UIFont(name: "Poppins-Bold", size: ofSize)
        case .semiBold:
            font = UIFont(name: "Poppins-SemiBold", size: ofSize)
        case .extraBold:
            font = UIFont(name: "Poppins-ExtraBold", size: ofSize)
        case .extraLight:
            font = UIFont(name: "Poppins-ExtraLight", size: ofSize)
        case .light:
            font = UIFont(name: "Poppins-Light", size: ofSize)
        case .medium:
            font = UIFont(name: "Poppins-Medium", size: ofSize)
        case .regular:
            font = UIFont(name: "Poppins-Regular", size: ofSize)
        case .thin:
            font = UIFont(name: "Poppins-Thin", size: ofSize)
        }
        return font ?? UIFont.systemFont(ofSize: ofSize)
    }
}

enum FontWeight {
    case black
    case bold
    case semiBold
    case extraBold
    case extraLight
    case light
    case medium
    case regular
    case thin
}
