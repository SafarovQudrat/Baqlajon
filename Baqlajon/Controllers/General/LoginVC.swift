//
//  SignInVC.swift
//  Baqlajon
//
//  Created by Ali on 11/02/23.
//

import UIKit
import PhoneNumberKit
import Alamofire

class LoginVC: UIViewController {
    
    //subview:
    lazy var loginView: UIView = {
        let v = UIView()
        v.isUserInteractionEnabled = true
        v.backgroundColor = .clear
        return v
    }()
    //title Label
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome\nBack!"
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 28,weight: FontWeight.medium)
        lbl.textColor = .label
        lbl.numberOfLines = 2
        return lbl
    }()
    //stackView for textFields
    let textFieldStackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.spacing = 16
        sv.distribution = .fillEqually
        sv.axis = .vertical
        return sv
    }()
    //phoneNumber textField
    private let phoneNumberTFView: PhoneNumberTextField = {
        let tf = PhoneNumberTextField()
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.placeholder = "Phone number"
        tf.keyboardType = .numberPad
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
    //Forgot Password Button
    let forgotPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Forgot Password", for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 14, weight: .medium)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(.none, action: #selector(frogotPasswordTapped), for: .touchUpInside)
        return btn
    }()
    //Sign Up Button
    private let loginBtn: BNButton = {
        let btn = BNButton()
        btn.backgroundColor = .appColor(color: .mainBlue)
        btn.layer.cornerRadius = 8
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 16,weight: FontWeight.medium)
        btn.addTarget(.none, action: #selector(loginTapped), for: .touchUpInside)
        return btn
    }()
    //stackView for items witch switchs to SignUpVC
    let switchDetailStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 4
        sv.distribution = .equalSpacing
        sv.alignment = .fill
        return sv
    }()
    //"Don't have an account?" Label
    let switchToSignUplbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Don't have an account?"
        lbl.textAlignment = .center
        lbl.font = UIFont.appFont(ofSize: 14,weight: FontWeight.medium)
        lbl.textColor = .label
        return lbl
    }()
    //Switchs to SignUpVC
    let SwitchToSignUpBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 14, weight: .medium)
        btn.addTarget(.none, action: #selector(switchToSignUpTapped), for: .touchUpInside)
        return btn
    }()
    //MARK: -viewDidLoad-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        settingConstraints()
        navSettings()
        textFieldsDoneButton()
        setTextField()
        observeLangNotif()
        setLang()
        postNotif(lang: 2)
    }
    //MARK: adds "Done" button to textFields
    func textFieldsDoneButton() {
        phoneNumberTFView.addDoneButtonOnKeyboard()
        passwordTF.addDoneButtonOnKeyboard()
    }
    
    
    //MARK: Navigation Settings
    func navSettings() {
        title = "Let's Sign In"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.appFont(ofSize: 16,weight: FontWeight.medium)]
        navigationItem.hidesBackButton = true
        let backBtn = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .done, target: self, action: #selector(backtapped))
        navigationItem.leftBarButtonItem = backBtn
    }
    //    back Button
        @objc func backtapped(){
            self.navigationController?.popViewController(animated: true)
        }
    
    //MARK: Number textField
    func setTextField() {
        phoneNumberTFView.backgroundColor = .appColor(color: .gray7)
        phoneNumberTFView.defaultRegion = "UZ"
        phoneNumberTFView.withFlag = true
        phoneNumberTFView.withExamplePlaceholder = true
        phoneNumberTFView.spellCheckingType = .yes
        phoneNumberTFView.autocorrectionType = .yes
    }
    
    func setLang() {
        titleLbl.text = Lang.getString(type: .welcome)
        phoneNumberTFView.placeholder = Lang.getString(type: .welcomeNTf)
        passwordTF.placeholder = Lang.getString(type: .welcomeP)
        forgotPasswordBtn.setTitle(Lang.getString(type: .welcomeFP), for: .normal)
        switchToSignUplbl.text = Lang.getString(type: .haveAccaunt)
    }
}





extension LoginVC {
    
    //MARK: -Login view UI settings-
    func settingConstraints() {
        
        view.addSubview(loginView)
        loginView.snp.makeConstraints { $0.top.bottom.left.right.equalTo(view) }
        
        loginView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(loginView).inset(123)
            make.left.equalTo(loginView).inset(24)
        }
        
        loginView.addSubview(textFieldStackView)
        textFieldStackView.snp.makeConstraints { make in
            make.left.right.equalTo(loginView).inset(24)
            make.top.equalTo(titleLbl.snp.bottom).offset(36)
        }
        
        textFieldStackView.addArrangedSubview(phoneNumberTFView)
        textFieldStackView.addArrangedSubview(passwordTF)
        passwordTF.snp.makeConstraints { $0.height.equalTo(48) }
        
        loginView.addSubview(forgotPasswordBtn)
        forgotPasswordBtn.snp.makeConstraints { make in
            make.right.equalTo(textFieldStackView.snp.right)
            make.top.equalTo(textFieldStackView.snp.bottom).offset(8)
            make.height.equalTo(20)
        }
        
        loginView.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(textFieldStackView.snp.bottom).offset(109)
            make.left.right.equalTo(loginView).inset(24)
        }
        
        loginView.addSubview(switchDetailStackView)
        switchDetailStackView.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).offset(12)
            make.centerX.equalTo(loginBtn)
            make.width.equalTo(240)
        }
        
        switchDetailStackView.addArrangedSubview(switchToSignUplbl)
        switchDetailStackView.addArrangedSubview(SwitchToSignUpBtn)
        
        //        loginView.addSubview(titleLbl)
        //        titleLbl.snp.makeConstraints { make in
        //            make.top.equalTo(switchDetailStackView).offset(20)
        //            make.right.left.equalTo(loginView).inset(30)
        //        }
        
    }
    
    
}




//MARK: -Action Buttons-
extension LoginVC {
    
    //tap gesture Tapped
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Hello World")
    }
    
    //password show/hide Tapped
    @objc func eyeTapped(sender: UIButton) {
        if passwordTF.isSecureTextEntry {
            openPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordTF.isSecureTextEntry = false
        }else {
            openPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTF.isSecureTextEntry = true
        }
    }
    
    
    //Login Tapped
    @objc func loginTapped() {
        let vc = OtpVC()
        Loader.start()
        if Reachability.isConnectedToNetwork(){
            getLogin { data in
                Loader.stop()
                print("kelgan malumot = ",data)
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
    
    //Opens ForgotVC Tapped
    @objc func frogotPasswordTapped() {
        cache.set(false, forKey: "changeNumber")
        navigationController?.pushViewController(ForgotVC(), animated: true)
        
    }
    
    //Opens SignUpVC Tapped
    @objc func switchToSignUpTapped() {
        ChangeRootViewController.change(with: UINavigationController(rootViewController: SignUpVC()))
    }
    
}




//API connect
extension LoginVC {
    func getLogin(complation:@escaping (LoginDM)->Void){
        
            API.getLogin(number: (phoneNumberTFView.text?.replacingOccurrences(of: " ", with: ""))!, password: passwordTF.text!) { data in
                complation(data)
            }
       
    }
    func sendOtp(){
        API.sendOtp(number: (phoneNumberTFView.text?.replacingOccurrences(of: " ", with: ""))!) { data in
//
        }
    }
}

//MARK: - NnotificationCenter for language changing
extension LoginVC {
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
extension LoginVC {
    func postNotif(lang: Int) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "LANGNOTIFICATION"), object: lang, userInfo: nil)
        print("NotificationCenter LanguageVC \(lang)")
    }
}

