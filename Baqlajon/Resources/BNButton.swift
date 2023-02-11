//
//  BButton.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit

class BNButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .appColor(color: .mainBlue)
        self.titleLabel?.font = .appFont(ofSize: 16, weight: .medium)
        self.layer.cornerRadius = 8
        self.setTitleColor(.label, for: .normal)
    }
    
}
