//
//  ResetPasswordVC.swift
//  Baqlajon
//
//  Created by Ali on 16/02/23.
//

import UIKit

class ResetPasswordVC: UIViewController {
    
    //view for resetPasswordVC
    let resetView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    //main description Label
    let textLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter a new password!"
        lbl.numberOfLines = 0
        lbl.font = UIFont.appFont(ofSize: 14, weight: .medium)
        lbl.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.5294117647, alpha: 1)
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    //new password textField
    private lazy var newPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray7)
        tf.font = UIFont.appFont(ofSize: 16, weight: .regular)
        tf.leftViewMode = .always
        tf.rightViewMode = .always
        let lview: UIView = {
            let lv = UIView()
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        tf.borderStyle = .none
        tf.isSecureTextEntry = true
        
        openNewPasswordBtn.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        tf.rightView = openNewPasswordBtn
        return tf
    }()
    
    
    //new passwords show/hide (eye) Button
    lazy var openNewPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .systemGray
        btn.addTarget(self, action: #selector(newPasswordEyeTapped), for: .touchUpInside)
        return btn
    }()
    
    //password textField
    private lazy var confirmNewPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray7)
        tf.font = UIFont.appFont(ofSize: 16, weight: .regular)
        tf.leftViewMode = .always
        tf.rightViewMode = .always
        let lview: UIView = {
            let lv = UIView()
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        tf.borderStyle = .none
        tf.isSecureTextEntry = true
        
        openConfirmNewPasswordBtn.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        tf.rightView = openConfirmNewPasswordBtn
        return tf
    }()
    
    
    //passwords show/hide (eye) Button
    lazy var openConfirmNewPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .systemGray
        btn.addTarget(self, action: #selector(confirmPasswordEyeTapped), for: .touchUpInside)
        return btn
    }()
    
    //confirm Button
    let confirmBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Confirm", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 16,weight: .medium)
        btn.backgroundColor = .appColor(color: .mainBlue)
        btn.layer.cornerRadius = 8
        btn.addTarget(.none, action: #selector(confirmTapped), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUIItems()
        title = "Reset Password"
        navigationItem.hidesBackButton = true
        let backBtn = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .done, target: self, action: #selector(backtapped))
        navigationItem.leftBarButtonItem = backBtn
    }
    //    back Button
        @objc func backtapped(){
            self.navigationController?.popViewController(animated: true)
        }
    
    //MARK: setting UIItems constraints
    func setUIItems() {
        view.addSubview(resetView)
        resetView.snp.makeConstraints { $0.top.right.left.bottom.equalTo(view) }
        
        resetView.addSubview(textLbl)
        textLbl.snp.makeConstraints { make in
            make.top.equalTo(resetView).inset(123)
            make.right.left.equalTo(resetView).inset(24)
        }
        
        resetView.addSubview(newPasswordTF)
        newPasswordTF.snp.makeConstraints { make in
            make.top.equalTo(textLbl.snp.bottom).offset(100)
            make.right.left.equalTo(resetView).inset(24)
            make.height.equalTo(48)
        }
        
        resetView.addSubview(confirmNewPasswordTF)
        confirmNewPasswordTF.snp.makeConstraints { make in
            make.top.equalTo(newPasswordTF.snp.bottom).offset(16)
            make.right.left.equalTo(resetView).inset(24)
            make.height.equalTo(48)
        }
        
        resetView.addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { make in
            make.top.equalTo(confirmNewPasswordTF.snp.bottom).offset(40)
            make.right.left.equalTo(resetView).inset(24)
            make.height.equalTo(48)
        }
    }
    
}



//MARK: - objc functions
extension ResetPasswordVC {
    
    @objc func newPasswordEyeTapped() {
        if newPasswordTF.isSecureTextEntry {
            openNewPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            newPasswordTF.isSecureTextEntry = false
        }else {
            openNewPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            newPasswordTF.isSecureTextEntry = true
        }
    }
    
    @objc func confirmPasswordEyeTapped() {
        if confirmNewPasswordTF.isSecureTextEntry {
            openConfirmNewPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            confirmNewPasswordTF.isSecureTextEntry = false
        }else {
            openConfirmNewPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            confirmNewPasswordTF.isSecureTextEntry = true
        }
    }
    
    @objc func confirmTapped() {
        if newPasswordTF.text!.count >= 8, newPasswordTF.text!.count <= 16, confirmNewPasswordTF.text!.count >= 8, confirmNewPasswordTF.text!.count <= 16, newPasswordTF.text! == confirmNewPasswordTF.text! {
            print("confirm tapped")
        }
    }
}
