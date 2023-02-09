//
//  SignVC.swift
//  Baqlajon
//
//  Created by Ali on 07/02/23.
//

import UIKit
import SnapKit

class SignVC: UIViewController {
    
    var isLogin = true
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
    
    //MARK: SignIn View Details:
    lazy var loginView: UIView = {
        let v = UIView()
        v.addGestureRecognizer(tapGestureRecognizer)
        v.backgroundColor = .clear
        return v
    }()
    
    
    //title Label
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 28,weight: FontWeight.medium)
        lbl.textColor = .label
        lbl.numberOfLines = 2
        return lbl
    }()
    
    //eye Button
    lazy var openPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "eye"), for: .normal)
        btn.tintColor = .systemGray
        btn.addTarget(self, action: #selector(eyeTapped), for: .touchUpInside)
        return btn
    }()
    
    //password textField
    private lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .systemGray6
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
    
    //forgotPassword Button
    private let forgotBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Forgot Password", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(forgotTapped), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 14,weight: FontWeight.medium)
        return btn
    }()
    
    
    //forgotBtn StackView
    private let forgotBtnSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .trailing
        sv.distribution = .equalSpacing
        sv.spacing = 8
        return sv
    }()
    
    //phoneNumber textField
    private let pnumberTF: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.keyboardType = .numberPad
        tf.backgroundColor = .systemGray6
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
    
    //titleLbl StackView
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        sv.axis = .vertical
        sv.spacing = 46
        return sv
    }()
    
    //TextField's StackView
    let tfStackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 16
        return sv
    }()
    
    //Sign Up Button's StackView
    let btnStackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        sv.axis = .vertical
        sv.spacing = 80
        return sv
    }()
    
    //Sign Up Button
    private let login_signUpBtn: BNButton = {
        let btn = BNButton()
        btn.backgroundColor = .appColor(color: .mainBlue)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.appFont(ofSize: 16,weight: FontWeight.medium)
        btn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return btn
    }()
    
    let signuplbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Don't have an account?"
        lbl.font = UIFont.appFont(ofSize: 14,weight: FontWeight.medium)
        lbl.textColor = .label
        return lbl
    }()
    
    let switchSignUpBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor( .systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(goSignUpTapped), for: .touchUpInside)
        return btn
    }()
    
    let switchDetailStackV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 4
        sv.distribution = .equalSpacing
        sv.alignment = .fill
        return sv
    }()
    
    
    
    //MARK: SignUp View Details:
    lazy var signUpView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.addGestureRecognizer(tapGestureRecognizer)
        return v
    }()
    
    //name textField
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full name*"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .systemGray6
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
    let refcodeTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Referral code"
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.backgroundColor = .systemGray6
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
    
    
    
    
    //MARK: -viewDidLoad-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loginCase()
        navSettings()
    }
    
    //MARK: Navigation Settings
    func navSettings() {
        if isLogin {
            title = "Let's Sign In"
        }else {
            title = "Let's Sign Up"
        }
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.appFont(ofSize: 16,weight: FontWeight.medium)]
    }
    
    //MARK: -SignUp view UI settings-
    func signUpCase() {
        loginView.isHidden = true
        signUpView.isHidden = false
        passwordTF.isHidden = true
        nameTF.isHidden = false
        pnumberTF.placeholder = "Phone number*"
        signuplbl.text = "Already have an account?"
        refcodeTF.isHidden = false
        view.addSubview(signUpView)
        signUpView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalTo(0)
        }
        signUpView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(signUpView.snp.top).inset(123)
            make.left.equalTo(signUpView.snp.left).inset(24)
        }
        titleLbl.text = "Create\nAccount!"
        login_signUpBtn.setTitle( "Sign Up", for: .normal)
        signUpView.addSubview(tfStackView)
        
        tfStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).inset(-36)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        tfStackView.addArrangedSubview(nameTF)
        nameTF.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        tfStackView.addArrangedSubview(pnumberTF)
        tfStackView.addArrangedSubview(refcodeTF)
        
        signUpView.addSubview(login_signUpBtn)
        login_signUpBtn.snp.makeConstraints { make in
            make.top.equalTo(tfStackView.snp.bottom).inset(-80)
            make.right.equalTo(-24)
            make.height.equalTo(48)
            make.left.equalTo(24)
        }
        
        switchDetailStackV.addArrangedSubview(signuplbl)
        switchDetailStackV.addArrangedSubview(switchSignUpBtn)
        switchSignUpBtn.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
        
        signUpView.addSubview(switchDetailStackV)
        switchDetailStackV.snp.makeConstraints { make in
            make.top.equalTo(login_signUpBtn.snp.bottom).inset(-12)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    
    //MARK: -Login view UI settings-
    func loginCase() {
        signUpView.isHidden = true
        loginView.isHidden = false
        passwordTF.isHidden = false
        pnumberTF.placeholder = "Phone number"
        signuplbl.text = "Don't have an account?"
        nameTF.isHidden = true
        refcodeTF.isHidden = true
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalTo(0)
        }
        
        titleLbl.text = "Welcome\nBack!"
        login_signUpBtn.setTitle( "Login", for: .normal)
        loginView.addSubview(btnStackView)
        btnStackView.snp.makeConstraints { make in
            make.top.equalTo(loginView.safeAreaLayoutGuide.snp.top).inset(30)
            make.left.right.equalToSuperview().inset(24)
        }
        
        stackView.addArrangedSubview(titleLbl)
        
        stackView.addArrangedSubview(forgotBtnSV)
        forgotBtn.snp.makeConstraints { make in
            make.width.equalTo(117)
            make.height.equalTo(20)
        }
        
        forgotBtnSV.addArrangedSubview(tfStackView)
        tfStackView.snp.makeConstraints { make in
            make.left.right.equalTo(0)
        }
        forgotBtnSV.addArrangedSubview(forgotBtn)
        
        tfStackView.addArrangedSubview(pnumberTF)
        pnumberTF.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        tfStackView.addArrangedSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        btnStackView.addArrangedSubview(stackView)
        btnStackView.addArrangedSubview(login_signUpBtn)
        login_signUpBtn.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        switchDetailStackV.addArrangedSubview(signuplbl)
        switchDetailStackV.addArrangedSubview(switchSignUpBtn)
        switchSignUpBtn.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
        
        loginView.addSubview(switchDetailStackV)
        switchDetailStackV.snp.makeConstraints { make in
            make.top.equalTo(btnStackView.snp.bottom).inset(-10)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    
    
    
    
    
    
    //MARK: -Buttons-
    
    
    //MARK: forgotPassword Btn Tapped
    @objc func forgotTapped() {
        navigationController?.pushViewController(ForgotVC(), animated: true)
    }
    
    @objc func tapGesture() {
        title = "Gesture is tapped"
    }
    
    //MARK: eyeBtnTapped
    @objc func eyeTapped(sender: UIButton) {
        if passwordTF.isSecureTextEntry {
            openPasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordTF.isSecureTextEntry = false
        }else {
            openPasswordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTF.isSecureTextEntry = true
        }
    }
    
    
    
    //MARK: signedUpTapped
    @objc func loginTapped() {
        navigationController?.pushViewController(OtpVC(), animated: true)
    }
    
    
    
    //MARK: switched to Sign Up
    @objc func goSignUpTapped() {
        if isLogin {
            signUpCase()
            switchSignUpBtn.setTitle("Sign Up", for: .normal)
            isLogin = false
        }else {
            loginCase()
            switchSignUpBtn.setTitle("Sign In", for: .normal)
            isLogin = true
        }
        navSettings()
    }
    
}
