//
//  OtpVC.swift
//  Baqlajon
//
//  Created by Ali on 08/02/23.
//

import UIKit
import OTPFieldView
import SwiftyJSON

class OtpVC: UIViewController {
    
    var otpIsCorrect = false
    var number:String = ""
    var otp:String = ""
    let lbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 2
        lbl.textColor = .appColor(color: .gray1)
        lbl.font = UIFont.appFont(ofSize: 14)
        lbl.textAlignment = .center
        return lbl
    }()
    var isForgot = false
    var isLogin = false
    //View for OTP textField
    let otpView: OTPFieldView = {
        let v = OTPFieldView()
        return v
    }()
    
    
    //View for OTP ViewController
    let otpViewController: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0, green: 0.961252749, blue: 0.3269677758, alpha: 0.3143335459)
        v.backgroundColor = .appColor(color: .background)
        return v
    }()
    
    //Confirm Button
    private let confirmBtn: BNButton = {
        let btn = BNButton()
        btn.backgroundColor = .appColor(color: .mainBlue)
        btn.layer.cornerRadius = 8
        btn.setTitle("Confirm", for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 16,weight: FontWeight.medium)
        btn.addTarget(.none, action: #selector(confirmTapped), for: .touchUpInside)
        return btn
    }()
    private lazy var timeLbl:UILabel = {
        let l = UILabel()
        l.font = .appFont(ofSize: 14)
        l.textColor = .appColor(color: .mainBlue)
        l.text = "Vaqt 0:59"
        return l
    }()
    private lazy var resendButton:UIButton = {
        let b = UIButton()
        b.titleLabel?.font = .appFont(ofSize: 14)
        b.setTitleColor(.appColor(color: .mainBlue), for: .normal)
        b.setTitle("Resend Code", for: .normal)
        return b
    }()
    
    var timer:Timer?
    var time: Int = 59
    var lastName:String = ""
    var firstName:String = ""
    var password:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor(color: .white)
        uiSettings()
        navDetais()
        setupOtpView()
        setLang()
        observeLangNotif()
    }
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
    }
    @objc func action () {
        if time <= 0 {
            timer?.invalidate()
            timeLbl.isHidden = true
            resendButton.isHidden = false
        } else {
            time = time - 1
        }
        if time < 10 {
            timeLbl.text = "Vaqt: 0:0\(time)"
        } else {
            timeLbl.text = "Vaqt: 0:\(time)"
        }
    }
    
    //MARK: set textFieldView
    func setupOtpView() {
        otpView.backgroundColor = .clear
        otpView.fieldsCount = 6
        otpView.filledBackgroundColor = .systemGray6
        otpView.defaultBackgroundColor = .systemGray6
        otpView.defaultBorderColor = UIColor.clear
        otpView.filledBorderColor = UIColor.clear
        otpView.cursorColor = UIColor.systemBlue
        otpView.displayType = .roundedCorner
        otpView.fieldBorderWidth = 3
        otpView.fieldSize = 40
        otpView.separatorSpace = 6
        otpView.layer.shadowColor = UIColor.red.cgColor
        otpView.shouldAllowIntermediateEditing = true
        otpView.delegate = self
        otpView.initializeUI()
    }
    
    
    func navDetais() {
        title = "Verification code"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.appFont(ofSize: 14,weight: FontWeight.medium)]
    }
    
    //    confirmBtn Tapped
    @objc func confirmTapped(){
        Loader.start()
        if Reachability.isConnectedToNetwork(){
            if cache.bool(forKey: "changeNumber"){
                updateNumber { data in
                    if data["success"].boolValue {
                        Alert.showAlert(title: "", message: "Phone number changed", vc: self)
                        self.navigationController?.popToRootViewController(animated: true)
                    }else {
                        Alert.showAlert(title: data["message"].stringValue, message: data["message"].stringValue, vc: self)
                    }
                }
            }else if isForgot {
                checkOtp { [self] data in
                    Loader.stop()
                    if data.success {
                        let vc = ResetPasswordVC()
                        vc.number = number
                        vc.isForgot = isForgot
                        self.navigationController?.pushViewController(vc, animated: true)
                    }else {
                        Alert.showAlert(title: "", message: data.message, vc: self)
                    }
                }
            }else if isLogin {
                checkOtp { data in
                    if data.success {
                        cache.set(true, forKey: "isTabbar")
                        let vc = MainTabBarController()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }else {
                        Alert.showAlert(title: "Error", message: data.message, vc: self)
                    }
                }
            }else {
                checkOtp { [self] data in
                    Loader.stop()
                    
                    if data.success {
                        signUpRegister { data in
                            cache.set(true, forKey: "isTabbar")
                            let vc = MainTabBarController()
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: true)
                        }
                    } else {
                        Alert.showAlert(title: "Error", message: data.message, vc: self)
                    }
                }
            }
        }else {
            Alert.showAlert(title: "No Internet", message: "No internet connection", vc: self)
            Loader.stop()
        }
        
        
      
    }
    //MARK: draving UI
    func uiSettings() {
        lbl.text = "Please, enter the code we sent  \(number)"
        view.addSubview(otpViewController)
        otpViewController.snp.makeConstraints { make in
            make.top.bottom.right.left.equalTo(0)
        }
        otpViewController.addSubview(lbl)
        otpViewController.addSubview(otpView)
        lbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(63)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30)
        }
        otpView.snp.makeConstraints { make in
            make.top.equalTo(lbl).inset(70)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(50)
        }
        otpViewController.addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(otpView.snp_topMargin).inset(100)
            make.height.equalTo(50)
        }
        view.addSubview(timeLbl)
        timeLbl.snp.makeConstraints { make in
            make.top.equalTo(confirmBtn.snp_bottomMargin).offset(24)
            make.centerX.equalTo(view.snp_centerXWithinMargins)
        }
    }
    
    func setLang(){
        lbl.text = Lang.getString(type: .otpLbl)
    }
    
    
}
//MARK: OTPFieldViewDelegate
extension OtpVC: OTPFieldViewDelegate {
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        true
    }
    
    func enteredOTP(otp: String) {
        print("yes")
        print("OTPString: \(otp)")
        
        self.otp = otp
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print("Has entered all OTP? \(hasEnteredAll)")
        return false
    }
    
}
//MARK: - API
extension OtpVC {
    func checkOtp(complation:@escaping(LoginDM)->Void) {
        API.checkOtp(number: number, otp: otp) { data in
            complation(data)
        }
    }
    
    func updateNumber(complation:@escaping(JSON)->Void) {
        API.updatePhoneNumber(number: number, otp: otp) { data in
            complation(data)
        }
    }
    
    func signUpRegister( compilation: @escaping (LoginDM)->Void){
        
        API.register(lastName: lastName, firstName: firstName, number: number, password: password) { data in
            compilation(data)
            
        }
        
    }
    
    
    
}
//MARK: - NnotificationCenter for language changing
extension OtpVC {
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
