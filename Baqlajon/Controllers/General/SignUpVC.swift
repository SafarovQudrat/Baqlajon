//
//  SignVC.swift
//  Baqlajon
//
//  Created by Ali on 07/02/23.
//

import UIKit
import SnapKit
import SwiftPhoneNumberFormatter
import Alamofire

class SignUpVC: UIViewController {
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: .none, action: #selector(tapGesture))
    
    //MARK: SignUp View Details:
    lazy var signUpView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.addGestureRecognizer(tapGestureRecognizer)
        return v
    }()
    
    
    //title Label
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.text = "Create\nAccount!"
        lbl.font = UIFont.appFont(ofSize: 28,weight: FontWeight.medium)
        lbl.textColor = .appColor(color: .black1)
        lbl.numberOfLines = 2
        return lbl
    }()
    
    
    
    //name textField
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "First name*"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray6)
        tf.font = UIFont.appFont(ofSize: 16, weight: .regular)
        tf.borderStyle = .none
        tf.leftViewMode = .always
        let lview: UIView = {
            let lv = UIView()
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        return tf
    }()
    //name textField
    let surnameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Last name*"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray6)
        tf.font = UIFont.appFont(ofSize: 16, weight: .regular)
        tf.borderStyle = .none
        tf.leftViewMode = .always
        let lview: UIView = {
            let lv = UIView()
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        return tf
    }()
    
    
    //TextField's StackView
    let textFieldStackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 16
        return sv
    }()
    
    //phoneNumber textField
    private let phoneNumberTFView: PhoneFormattedTextField = {
        let tf = PhoneFormattedTextField()
        
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "## ### ## ##")
        tf.prefix = "+998 "
        tf.placeholder = "Phone number*"
        tf.keyboardType = .phonePad
        tf.backgroundColor = .appColor(color: .gray6)
        tf.font = UIFont.appFont(ofSize: 16, weight: .regular)
        tf.borderStyle = .none
        tf.leftViewMode = .always
        
        let lview: UIView = {
            let lv = UIView()
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        
        return tf
    }()
    
    //password textField
    private lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
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
        
        openPasswordBtn.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        tf.rightView = openPasswordBtn
        return tf
    }()
    //passwords show/hide (eye) Button
    lazy var openPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .systemGray
        btn.addTarget(self, action: #selector(eyeTapped), for: .touchUpInside)
        return btn
    }()
    
    //Sign Up Button
    private let signUpBtn: BNButton = {
        let btn = BNButton()
        btn.backgroundColor = .appColor(color: .mainBlue)
        btn.layer.cornerRadius = 8
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 16,weight: FontWeight.medium)
        btn.addTarget(.none, action: #selector(signUpTapped), for: .touchUpInside)
        return btn
    }()
    
    //stackView for items for login case
    let switchToLoginStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 4
        sv.distribution = .equalSpacing
        sv.alignment = .fill
        return sv
    }()
    
    //"Already have an account?" label
    let switchToLoginDescryptLbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "Already have an account?"
        lbl.font = UIFont.appFont(ofSize: 14,weight: FontWeight.medium)
        lbl.textColor = .label
        lbl.numberOfLines = 1
        return lbl
    }()
    
    //switchs to LoginVC
    let switchToLoginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor( .systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 14, weight: .medium)
        btn.addTarget(.none, action: #selector(goSignUpTapped), for: .touchUpInside)
        return btn
    }()
    
    //MARK: -viewDidLoad-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor(color: .background)
        navSettings()
        textFieldsDoneButton()
        signUpCase()
        
        setLang()
        observeLangNotif()
        postNotif(lang: 2)
    }
    
    
    //MARK: adds "Done" button to textFields
    func textFieldsDoneButton() {
        nameTF.addDoneButtonOnKeyboard()
        surnameTF.addDoneButtonOnKeyboard()
        phoneNumberTFView.addDoneButtonOnKeyboard()
        passwordTF.addDoneButtonOnKeyboard()
    }
    
    //MARK: Navigation Settings
    func navSettings() {
        title = "Let's Sign Up"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.appFont(ofSize: 16,weight: FontWeight.medium)]
        
    }
    //    back Button
    @objc func backtapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setLang(){
        titleLbl.text = Lang.getString(type: .createAcc)
        nameTF.placeholder = Lang.getString(type: .createNTF)
        surnameTF.placeholder = Lang.getString(type: .createLNTF)
        passwordTF.placeholder = Lang.getString(type: .createRC)
        phoneNumberTFView.placeholder = Lang.getString(type: .welcomeNTf)
    }
    
}
//MARK: -SignUp view UI settings-
extension SignUpVC {
    
    
    func signUpCase() {
        view.addSubview(signUpView)
        signUpView.snp.makeConstraints { $0.left.right.top.bottom.equalTo(view) }
        
        signUpView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.left.equalTo(signUpView).inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(24)
        }
        
        signUpView.addSubview(textFieldStackView)
        textFieldStackView.snp.makeConstraints { make in
            make.left.right.equalTo(signUpView).inset(24)
            make.top.equalTo(titleLbl.snp.bottom).offset(36)
        }
        
        textFieldStackView.addArrangedSubview(nameTF)
        textFieldStackView.addArrangedSubview(surnameTF)
        textFieldStackView.addArrangedSubview(phoneNumberTFView)
        textFieldStackView.addArrangedSubview(passwordTF)
        passwordTF.snp.makeConstraints { $0.height.equalTo(48)}
        
        signUpView.addSubview(signUpBtn)
        signUpBtn.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.right.left.equalTo(signUpView).inset(24)
            make.top.equalTo(textFieldStackView.snp.bottom).offset(60)
        }
        
        signUpView.addSubview(switchToLoginStackView)
        switchToLoginStackView.snp.makeConstraints { make in
            make.centerX.equalTo(signUpView)
            make.top.equalTo(signUpBtn.snp.bottom).offset(12)
            
        }
        
        switchToLoginStackView.addArrangedSubview(switchToLoginDescryptLbl)
        switchToLoginStackView.addArrangedSubview(switchToLoginBtn)
        switchToLoginBtn.snp.makeConstraints { make in
            make.height.equalTo(30)
            
        }
        
        
    }
    
    
    
}

//MARK: -Buttons-
extension SignUpVC {
    
    //MARK: forgotPassword Btn Tapped
    @objc func forgotTapped() {
        navigationController?.pushViewController(ForgotVC(), animated: true)
    }
    
    @objc func tapGesture() {
        title = "Gesture is tapped"
    }
    
    @objc func eyeTapped(){
        if passwordTF.isSecureTextEntry {
            openPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordTF.isSecureTextEntry = false
        }else {
            openPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTF.isSecureTextEntry = true
        }
    }
    
    
    //MARK: switched to Sign Up
    @objc func goSignUpTapped() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @objc func signUpTapped() {
        let vc = OtpVC()
        vc.isForgot = false
        Loader.start()
        if Reachability.isConnectedToNetwork() {
            signUpRegister { data in
                Loader.stop()
                if data.success {
                    self.navigationController?.pushViewController(vc, animated: true)
                    self.sendOtp()
                    vc.number = (self.phoneNumberTFView.text?.replacingOccurrences(of: " ", with: ""))!
                } else {
                    Alert.showAlert(title: data.message, message: data.message, vc: self)
                }
            }
            
        }else {
            Alert.showAlert(title: "No Internet", message: "No internet connection", vc: self)
            Loader.stop()
        }
        
    }
}

extension SignUpVC {
    func signUpRegister( compilation: @escaping (LoginDM)->Void){
        
        API.register(lastName: self.surnameTF.text!, firstName: self.nameTF.text!, number: (phoneNumberTFView.text?.replacingOccurrences(of: " ", with: ""))!, password: passwordTF.text!) { data in
            compilation(data)
            
        }
        
    }
    func sendOtp(){
        API.sendOtp(number: (phoneNumberTFView.text?.replacingOccurrences(of: " ", with: ""))!) { data in
            //
        }
    }
}
//MARK: - NnotificationCenter for language changing
extension SignUpVC {
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

//MARK: -Lang Notif
extension SignUpVC {
    func postNotif(lang: Int) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "LANGNOTIFICATION"), object: lang, userInfo: nil)
        print("NotificationCenter LanguageVC \(lang)")
    }
}

