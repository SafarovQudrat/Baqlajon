//
//  BTextField.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit
import SnapKit

class BNTextField: UITextField {

    let tf = UITextField()
    private let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        
    }
    
    func setupUI() {
        containerView.backgroundColor = .appColor(color: .gray7)
        containerView.layer.cornerRadius = 8
        containerView.addSubview(tf)
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.edges.equalTo(containerView).inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
        tf.returnKeyType = .done
        tf.autocorrectionType = .no
        tf.backgroundColor = .clear
        tf.tintColor = .appColor(color: .gray2)
        tf.font = .appFont(ofSize: 16)
        self.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }

}
