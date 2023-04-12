//
//  ForgotVC.swift
//  Baqlajon
//
//  Created by Ali on 09/02/23.
//

import UIKit

class ForgotVC: UIViewController {
    
    //main View
    let forgotView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    //main description Label
    var textLbl: UILabel = {
        let lbl = UILabel()
        
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = UIFont.appFont(ofSize: 14, weight: .medium)
        
        lbl.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.5294117647, alpha: 1)
        return lbl
    }()
    
    //phoneNumber textField
    private let phoneNumberTF: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 8
        tf.textColor = .label
        tf.placeholder = "Phone number"
        tf.keyboardType = .namePhonePad
        tf.backgroundColor = .appColor(color: .gray6)
        tf.font = UIFont.appFont(ofSize: 16, weight: .regular)
        //        tf.borderStyle = .none
        //        tf.leftViewMode = .always
        
        let lview: UIView = {
            let lv = UIView()
            lv.backgroundColor = .appColor(color: .gray6)
            return lv
        }()
        lview.snp.makeConstraints { make in
            make.width.equalTo(15)
        }
        tf.leftView = lview
        
        return tf
    }()
    
    
    //Send Code Button
    let sendCodeBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Send Code", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 16, weight: .medium)
        btn.backgroundColor = .appColor(color: .mainBlue)
        btn.layer.cornerRadius = 8
        btn.addTarget(.none, action: #selector(sendCodeTapped), for: .touchUpInside)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor(color: .background)
        navSettings()
        setUIItems()
        if cache.bool(forKey: "changeNumber") {
            title = "Change number"
            textLbl.text = "Please, enter your new phone number"
        } else {
            title = "Forgot Password"
            textLbl.text = "Please enter your registered phone number to reset your password!"
        }
        setLang()
        observeLangNotif()
    }
    
    
    //MARK: Navigation Settings
    func navSettings() {
        
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.appFont(ofSize: 16,weight: FontWeight.medium)]
        navigationItem.hidesBackButton = true
        let backBtn = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .done, target: self, action: #selector(backtapped))
        navigationItem.leftBarButtonItem = backBtn
    }
    
    //    back Button
    @objc func backtapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: setting UI constraints
    func setUIItems() {
        
        view.addSubview(forgotView)
        forgotView.snp.makeConstraints { $0.top.bottom.right.left.equalTo(view) }
        forgotView.addSubview(textLbl)
        textLbl.snp.makeConstraints { make in
            make.top.equalTo(forgotView).inset(123)
            make.left.right.equalTo(forgotView).inset(24)
        }
        
        forgotView.addSubview(phoneNumberTF)
        phoneNumberTF.snp.makeConstraints { make in
            make.top.equalTo(textLbl.snp.bottom).offset(78)
            make.right.left.equalTo(forgotView).inset(24)
            make.height.equalTo(48)
        }
        
        forgotView.addSubview(sendCodeBtn)
        sendCodeBtn.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTF.snp.bottom).offset(40)
            make.left.right.equalTo(forgotView).inset(24)
            make.height.equalTo(48)
        }
        
    }
    
    
    func setLang(){
        textLbl.text = Lang.getString(type: .forgotPassLbl)
        phoneNumberTF.placeholder = Lang.getString(type: .welcomeNTf)
    }
    
}



//MARK: -objc functions-
extension ForgotVC {
    
    @objc func sendCodeTapped() {
        if cache.bool(forKey: "changeNumber"){
            Loader.start()
            sendOtp { data in
                Loader.stop()
                if data.success {
                    let vc = OtpVC()
                    vc.number = (self.phoneNumberTF.text?.replacingOccurrences(of: " ", with: ""))!
                    self.navigationController?.pushViewController(vc, animated: true)
                }else {
                    Alert.showAlert(title: "Error", message: data.message, vc: self)
                }
            }
//            let vc = OtpVC()
//            vc.number = (self.phoneNumberTF.text?.replacingOccurrences(of: " ", with: ""))!
//            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            if phoneNumberTF.text == "" {
                Alert.showAlert(title: "Error", message: "Please enter phone number", vc: self)
            }else {
                let vc = ResetPasswordVC()
                vc.number = (self.phoneNumberTF.text?.replacingOccurrences(of: " ", with: ""))!
                vc.isForgot = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    
}

//MARK: - NnotificationCenter for language changing
extension ForgotVC {
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
//API
extension ForgotVC {
    func sendOtp(complation:@escaping(LoginDM)->Void) {
        API.sendOtp(number: phoneNumberTF.text!) { data in
            complation(data)
        }
    }
}
