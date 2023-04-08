//
//  OtpVC.swift
//  Baqlajon
//
//  Created by Ali on 08/02/23.
//

import UIKit
import OTPFieldView

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
    
    //View for OTP textField
    let otpView: OTPFieldView = {
        let v = OTPFieldView()
        return v
    }()
    
    
    //View for OTP ViewController
    let otpViewController: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0, green: 0.961252749, blue: 0.3269677758, alpha: 0.3143335459)
        v.backgroundColor = .systemBackground
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        uiSettings()
        navDetais()
        setupOtpView()
        setLang()
        observeLangNotif()
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
        otpView.fieldSize = 36
        otpView.separatorSpace = 6
        otpView.layer.shadowColor = UIColor.red.cgColor
        otpView.shouldAllowIntermediateEditing = true
        otpView.delegate = self
        otpView.initializeUI()
    }
    
    
    func navDetais() {
        title = "Verification code"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.appFont(ofSize: 14,weight: FontWeight.medium)]
        navigationItem.hidesBackButton = true
        let backBtn = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .done, target: self, action: #selector(backtapped))
        navigationItem.leftBarButtonItem = backBtn
    }
    //    back Button
    @objc func backtapped(){
        self.navigationController?.popViewController(animated: true)
    }
    //    confirmBtn Tapped
    @objc func confirmTapped(){
        Loader.start()
        if Reachability.isConnectedToNetwork(){
            checkOtp { data in
            Loader.stop()
            
            if data.success {
                cache.set(true, forKey: "isTabbar")
                let vc = MainTabBarController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            } else {
                Alert.showAlert(title: data.message, message: data.message, vc: self)
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
            make.top.bottom.right.left.equalTo(view)
        }
        otpViewController.addSubview(lbl)
        otpViewController.addSubview(otpView)
        lbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(63)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30)
        }
        otpView.snp.makeConstraints { make in
            make.top.equalTo(lbl).inset(70)
            make.left.equalTo(70)
            make.right.equalTo(-70)
            make.height.equalTo(50)
        }
        otpViewController.addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(otpView.snp_topMargin).inset(100)
            make.height.equalTo(50)
        }
        
    }
    
    func setLang(){
        lbl.text = Lang.getString(type: .otpLbl)
    }
    
    
}



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
//API
extension OtpVC {
    func checkOtp(complation:@escaping(LoginDM)->Void) {
        API.checkOtp(number: number, otp: otp) { data in
            complation(data)
        }
    }
    
    func updateNumber() {
        
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
