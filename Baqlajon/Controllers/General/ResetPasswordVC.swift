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
    
    private lazy var oldPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Old Password"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray6)
        tf.font = UIFont.appFont(ofSize: 16, weight: .regular)
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return tf
    }()
    
    //new password textField
    private lazy var newPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "New Password"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray6)
        tf.font = UIFont.appFont(ofSize: 16, weight: .regular)
    
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
        tf.placeholder = "Confirm Password"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray6)
        tf.font = UIFont.appFont(ofSize: 16, weight: .regular)
        
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
    
    lazy var stackV:UIStackView = {
        let v = UIStackView(arrangedSubviews: [oldPasswordTF,newPasswordTF,confirmNewPasswordTF,confirmBtn])
        v.spacing = 16
        v.distribution = .fillEqually
        v.axis = .vertical
        v.alignment = .fill
        return v
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
        view.backgroundColor = .appColor(color: .background)
        setUIItems()
        title = "Reset Password"
        navigationItem.hidesBackButton = true
        let backBtn = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .done, target: self, action: #selector(backtapped))
        navigationItem.leftBarButtonItem = backBtn
        observeLangNotif()
    }
    //    back Button
        @objc func backtapped(){
            self.navigationController?.popViewController(animated: true)
        }
    
    //MARK: setting UIItems constraints
    func setUIItems() {
      
        view.addSubview(textLbl)
        textLbl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.right.left.equalToSuperview().inset(24)
        }
        
        view.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.top.equalTo(textLbl.snp_bottomMargin).offset(24)
            make.right.left.equalToSuperview().inset(24)
            
        }
     
    }
    
    func setLang(){
        textLbl.text = Lang.getString(type: .resetPassLbl)
        newPasswordTF.placeholder = Lang.getString(type: .newPassTf)
        confirmNewPasswordTF.placeholder = Lang.getString(type: .confirmPassTf)
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
//MARK: - NnotificationCenter for language changing
extension ResetPasswordVC {
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
