//
//  SignVC.swift
//  Baqlajon
//
//  Created by Ali on 07/02/23.
//

import UIKit
import SnapKit

class SignVC: UIViewController {
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = """
        Create
        Account!
"""
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "System-Bold", size: 27)
        lbl.textColor = .label
        lbl.numberOfLines = 2
        return lbl
    }()
    
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "  Full name*"
        tf.layer.cornerRadius = 8
        tf.textColor = .black
        tf.backgroundColor = .systemGray5
        tf.borderStyle = .none
        return tf
    }()
    
    
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "  Password"
        tf.layer.cornerRadius = 8
        tf.textColor = .black
        tf.backgroundColor = .systemGray5
        tf.rightViewMode = .always
        tf.borderStyle = .none
        
        //textField's right button
        let openPasswordBtn: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "trash"), for: .normal)
            btn.addTarget(SignVC.self, action: #selector(eyeTapped), for: .touchUpInside)
            return btn
        }()
        openPasswordBtn.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        tf.rightView = openPasswordBtn
        //
        return tf
    }()
    
    @objc func eyeTapped(sender: UIButton) {
        
    }
    
    let pnumberTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "  Phone number*"
        tf.layer.cornerRadius = 8
        tf.textColor = .black
        tf.backgroundColor = .systemGray5
        tf.borderStyle = .none
        return tf
    }()
    
    let refcodeTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "  Referral code"
        tf.layer.cornerRadius = 8
        tf.textColor = .black
        tf.backgroundColor = .systemGray5
        tf.borderStyle = .none
        return tf
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        sv.axis = .vertical
        sv.spacing = 46
        return sv
    }()
    
    let tfStackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 16
        return sv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setView()
    }
    
    func setView() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30)
            make.left.right.equalToSuperview().inset(24)
        }
        
        stackView.addArrangedSubview(titleLbl)
        stackView.addArrangedSubview(tfStackView)
        
        tfStackView.addArrangedSubview(pnumberTF)
        pnumberTF.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        tfStackView.addArrangedSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }
    
}
