//
//  ResetPasswordVC.swift
//  Baqlajon
//
//  Created by Ali on 16/02/23.
//

import UIKit
import SwiftyJSON

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
        tf.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        oldPasswordBtn.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        tf.rightView = oldPasswordBtn
        return tf
    }()
    //passwords show/hide (eye) Button
    lazy var oldPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .systemGray
        btn.addTarget(self, action: #selector(oldPasswordEyeTapped), for: .touchUpInside)
        return btn
    }()
    
    //new password textField
    private lazy var newPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "New password"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray6)
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
        tf.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        newPasswordBtn.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        tf.rightView = newPasswordBtn
        return tf
    }()
    //passwords show/hide (eye) Button
    lazy var newPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .systemGray
        btn.addTarget(self, action: #selector(newPasswordEyeTapped), for: .touchUpInside)
        return btn
    }()
    
    //password textField
    private lazy var conifirmNewPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm password"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray6)
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
        
        confirmPasswordBtn.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        tf.rightView = confirmPasswordBtn
        return tf
    }()
    //passwords show/hide (eye) Button
    lazy var confirmPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .systemGray
        btn.addTarget(self, action: #selector(confirmPasswordEyeTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var stackV:UIStackView = {
        let v = UIStackView(arrangedSubviews: [oldPasswordTF,newPasswordTF,conifirmNewPasswordTF,confirmBtn])
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
    var changPass:((String)->Void)?
    var number: String = ""
    var isForgot:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor(color: .background)
        setUIItems()
        title = "Reset Password"
        
        observeLangNotif()
        if isForgot {
            oldPasswordTF.isHidden = true
            isForgot = false
        }else {
            oldPasswordTF.isHidden = false
        }
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
        conifirmNewPasswordTF.placeholder = Lang.getString(type: .confirmPassTf)
    }
    
}



//MARK: - objc functions
extension ResetPasswordVC {
    @objc func oldPasswordEyeTapped() {
        if newPasswordTF.isSecureTextEntry {
            oldPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            oldPasswordTF.isSecureTextEntry = false
        }else {
            oldPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            oldPasswordTF.isSecureTextEntry = true
        }
    }
    
    @objc func newPasswordEyeTapped() {
        if newPasswordTF.isSecureTextEntry {
            newPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            newPasswordTF.isSecureTextEntry = false
        }else {
            newPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            newPasswordTF.isSecureTextEntry = true
        }
    }
    
    @objc func confirmPasswordEyeTapped() {
        if conifirmNewPasswordTF.isSecureTextEntry {
            confirmPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            conifirmNewPasswordTF.isSecureTextEntry = false
        }else {
            confirmPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            conifirmNewPasswordTF.isSecureTextEntry = true
        }
    }
    
    @objc func confirmTapped() {
       
        
        if newPasswordTF.text!.count >= 8, newPasswordTF.text!.count <= 16, conifirmNewPasswordTF.text!.count >= 8, conifirmNewPasswordTF.text!.count <= 16, newPasswordTF.text! == conifirmNewPasswordTF.text! {
            if cache.bool(forKey: "changeNumber") {
                
                self.navigationController?.popToRootViewController(animated: true)
                
            }else{
                putData { data in
                    
                    if data["success"].boolValue {
                        self.navigationController?.popToRootViewController(animated: true)
                    } else {
                        
                        guard let arr = data["data"].arrayValue.first else {return}
                        print("dataaa = ",arr["constraints"].arrayValue.first!["value"].stringValue)
                        Alert.showAlert(title: data["message"].stringValue, message:arr["constraints"].arrayValue.first!["value"].stringValue  ,vc: self)
                    }
                }
            }
            
        }else {
            Alert.showAlert(title: "Error", message: "Password must be longer than 8 characters", vc: self)
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
//MARK: -API
extension ResetPasswordVC {
    func putData(complation:@escaping(JSON)->Void){
        print("number=",number)
        print("OTP=",self.conifirmNewPasswordTF.text!)
        API.forgetPass(number: number,password:self.conifirmNewPasswordTF.text!) { data in
            complation(data)
        
        }
    }
    
}
