//
//  SignVC.swift
//  Baqlajon
//
//  Created by Ali on 07/02/23.
//

import UIKit
import SnapKit
import PhoneNumberKit

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
        lbl.textColor = .label
        lbl.numberOfLines = 2
        return lbl
    }()
    
    
    
    //name textField
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "First name*"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray7)
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
        tf.backgroundColor = .appColor(color: .gray7)
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
    private let phoneNumberTFView: PhoneNumberTextField = {
        let tf = PhoneNumberTextField()
        
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.placeholder = "Phone number*"
        tf.keyboardType = .numberPad
        tf.backgroundColor = .blue
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
    
    //referralCode textField
    let referalCodeTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Referral code"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .appColor(color: .gray7)
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
        view.backgroundColor = .systemBackground
        navSettings()
        textFieldsDoneButton()
        signUpCase()
        setTextField()
    }
    
    
    //MARK: adds "Done" button to textFields
    func textFieldsDoneButton() {
        nameTF.addDoneButtonOnKeyboard()
        surnameTF.addDoneButtonOnKeyboard()
        phoneNumberTFView.addDoneButtonOnKeyboard()
        referalCodeTF.addDoneButtonOnKeyboard()
    }
    
    
    
    //MARK: Navigation Settings
    func navSettings() {
        title = "Let's Sign Up"
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
    
}

extension SignUpVC {
    
    //MARK: -SignUp view UI settings-
    func signUpCase() {
        view.addSubview(signUpView)
        signUpView.snp.makeConstraints { $0.left.right.top.bottom.equalTo(view) }
        
        signUpView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.left.equalTo(signUpView).inset(24)
            make.top.equalTo(signUpView).inset(123)
        }
        
        signUpView.addSubview(textFieldStackView)
        textFieldStackView.snp.makeConstraints { make in
            make.left.right.equalTo(signUpView).inset(24)
            make.top.equalTo(titleLbl.snp.bottom).offset(36)
        }
        
        textFieldStackView.addArrangedSubview(nameTF)
        textFieldStackView.addArrangedSubview(surnameTF)
        textFieldStackView.addArrangedSubview(phoneNumberTFView)
        textFieldStackView.addArrangedSubview(referalCodeTF)
        referalCodeTF.snp.makeConstraints { $0.height.equalTo(48)}
        
        signUpView.addSubview(signUpBtn)
        signUpBtn.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.right.left.equalTo(signUpView).inset(24)
            make.top.equalTo(textFieldStackView.snp.bottom).offset(80)
        }
        
        signUpView.addSubview(switchToLoginStackView)
        switchToLoginStackView.snp.makeConstraints { make in
            make.centerX.equalTo(signUpView)
            make.top.equalTo(signUpBtn.snp.bottom).offset(12)
            make.width.equalTo(260)
        }
        
        switchToLoginStackView.addArrangedSubview(switchToLoginDescryptLbl)
        switchToLoginStackView.addArrangedSubview(switchToLoginBtn)
        switchToLoginBtn.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(70)
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
    
    
    
    //MARK: switched to Sign Up
    @objc func goSignUpTapped() {
        ChangeRootViewController.change(with: UINavigationController(rootViewController: LoginVC()))
    }
    
    
    
    
    @objc func signUpTapped() {
        let vc = OtpVC()
        //        vc.dataLbl = PhoneNumberTextField.text
        navigationController?.pushViewController(vc, animated: true)
        signUpRegister()
    }
}

extension SignUpVC {
    func signUpRegister(){
        let param:[String:Any] = [
            "firstName": self.nameTF.text!,
            "lastName": surnameTF.text!,
            "password": referalCodeTF.text!,
            "phoneNumber": phoneNumberTFView.text!
            
            
        ]
        
        
        Net.req(urlAPI: "https://baqlajonapi.roundedteam.uz/user", method: .post, params: param) { data in
            if let data = data {
                let token = data["data"]["token"].stringValue
                cache.set(token, forKey: "TOKEN")
                print("Login Data = ",data)
            }
        }
        
    }
}
