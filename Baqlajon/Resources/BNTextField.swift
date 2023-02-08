//
//  BTextField.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit
import SnapKit

class BNTextField: UITextField {

    private let titleLbl = UILabel()
    let tf = UITextField()
    private let v_sv = UIStackView(views: [], axis: .vertical, spacing: 4, alignment: .fill, distribution: .fill)
    private let h_sv = UIStackView(views: [], axis: .horizontal, spacing: 0, alignment: .fill, distribution: .fill)
    private let containerView = UIView()
   
    
    @IBInspectable
    override var placeholder: String? {
        get {
            return tf.placeholder
        }
        set {
            tf.placeholder = newValue
        }
    }
    
    @IBInspectable var contViewBackgroundColor: UIColor? = UIColor(named: "white_color")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    func setupUI() {
        containerView.backgroundColor = .appColor(color: .gray7)
        containerView.layer.cornerRadius = 8
        
        containerView.addSubview(h_sv)
        
        h_sv.addArrangedSubview(tf)
        h_sv.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.edges.equalTo(containerView).inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
        tf.returnKeyType = .done
        tf.autocorrectionType = .no
        tf.backgroundColor = .clear
        tf.tintColor = .appColor(color: .gray2)
        tf.font = .appFont(ofSize: 16)
        v_sv.addArrangedSubview(containerView)
        self.addSubview(v_sv)
        v_sv.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }

}
