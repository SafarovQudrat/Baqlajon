//
//  PaymentsVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 09/02/23.
//

import UIKit
import IQKeyboardManager
import Hero
class PaymentsVC: UIViewController {
    
    //constants
    private lazy var backgroundView:UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    private lazy var containerV:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .appColor(color: .background)
        containerView.layer.cornerRadius = 8
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.snp.makeConstraints { make in
            make.height.equalTo(360)
            make.width.equalTo(344)
        }
        return containerView
    }()
    private lazy var paymentLbl:UILabel = {
        let titleLbl = UILabel()
        titleLbl.font = .appFont(ofSize: 16,weight: .medium)
        titleLbl.text = "Payment"
        titleLbl.textAlignment = .center
        titleLbl.textColor = .appColor(color: .black1)
        return titleLbl
    }()
    private lazy var cancelBtn:UIButton = {
        let cancelBtn = UIButton()
        cancelBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelBtn.tintColor = .appColor(color: .gray3)
        cancelBtn.addTarget(.none, action: #selector(cancelTapped), for: .touchUpInside)
        cancelBtn.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        return cancelBtn
    }()
    private lazy var pStackV:UIStackView = {
        let pStack = UIStackView(arrangedSubviews: [paymentLbl,cancelBtn])
        pStack.alignment = .fill
        pStack.spacing = 8
        pStack.axis = .horizontal
        pStack.distribution = .equalSpacing
        return pStack
    }()
    private lazy var backV: UIView = {
        let backV = UIView()
        backV.backgroundColor = .clear
        backV.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        return backV
    }()
    private lazy var backImg: UIImageView = {
        let backImage = UIImageView(image: UIImage(named: "PaymentsBack"))
        backImage.contentMode = .scaleAspectFill
        backImage.backgroundColor = .clear
        backImage.tintColor = .black
        return backImage
    }()
    //    course cost
    private lazy var summLbl:UILabel = {
        let messLbl = UILabel()
        messLbl.text = "99.000"
        messLbl.textColor = .white
        messLbl.font = .appFont(ofSize: 22,weight: .medium)
        return messLbl
    }()
    private lazy var textLbl:UILabel = {
        let txt = UILabel()
        txt.text = "/ For a month"
        txt.textColor = .white
        txt.font = .appFont(ofSize: 16)
        return txt
    }()
    private lazy var lblStack:UIStackView = {
        let lblStack = UIStackView(arrangedSubviews: [summLbl,textLbl])
        lblStack.alignment = .fill
        lblStack.spacing = 8
        lblStack.axis = .horizontal
        lblStack.distribution = .fill
        return lblStack
    }()
    //    Referal Code text field
    private lazy var tfView:UIView = {
        let txtView = UIView()
        txtView.backgroundColor = .appColor(color: .gray7)
        txtView.layer.cornerRadius = 10
        txtView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return txtView
    }()
    private lazy var txtField:UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Referral code"
        
        txtField.backgroundColor = .clear
        txtField.textColor = .black
        return txtField
    }()
    //    Continue Btn
    private lazy var okBtn:UIButton = {
        let okBtn = UIButton()
        okBtn.backgroundColor = .appColor(color: .mainBlue)
        okBtn.setTitle("Continue", for: .normal)
        okBtn.titleLabel?.font = .appFont(ofSize: 16,weight: .medium)
        okBtn.setTitleColor(.white, for: .normal)
        okBtn.addTarget(.none, action: #selector(okTapped), for: .touchUpInside)
        okBtn.layer.cornerRadius = 10
        okBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return okBtn
    }()
    //    Payments Method
    private lazy var paymeV:UIView = {
        let v = UIView()
        v.backgroundColor = .appColor(color: .gray7)
        v.layer.cornerRadius = 10
        return v
    }()
    private var clickV:UIView = {
        let v = UIView()
        v.backgroundColor = .appColor(color: .gray7)
        v.layer.cornerRadius = 10
        return v
    }()
    private var paymeIM:UIImageView = {
        let i = UIImageView(image: UIImage(named: "Pay me"))
        return i
    }()
    private var clickIM:UIImageView = {
        let i = UIImageView(image: UIImage(named: "Click"))
        return i
    }()
    private var paymeSIM:UIImageView = {
        let i = UIImageView(image: UIImage(named: "false"))
        return i
    }()
    private var clickSIM:UIImageView = {
        let i = UIImageView(image: UIImage(named: "false"))
        return i
    }()
    private lazy var paymeStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [paymeIM,paymeSIM])
        s.distribution = .equalSpacing
        s.axis = .horizontal
        s.spacing = 24
        s.alignment = .fill
        return s
    }()
    private lazy var clickStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [clickIM,clickSIM])
        s.distribution = .equalSpacing
        s.axis = .horizontal
        s.spacing = 24
        s.alignment = .fill
        return s
    }()
    private lazy var sttackV:UIStackView = {
        let s = UIStackView(arrangedSubviews: [paymeV,clickV])
        
        s.alignment = .fill
        s.spacing = 16
        s.axis = .horizontal
        s.distribution = .equalSpacing
        
        
        return s
    }()
    //    Payment selection Btn
    private var isPayme:UIButton = {
        let b = UIButton()
        b.addTarget(.none, action: #selector(isPaymeTapped), for: .touchUpInside)
        return b
    }()
    private var isClick:UIButton = {
        let b = UIButton()
        b.addTarget(.none, action: #selector(IsClickTapped), for: .touchUpInside)
        return b
    }()
    private lazy var containerStackV:UIStackView = {
        let containerStackV = UIStackView(arrangedSubviews: [backV,tfView,sttackV])
        containerStackV.spacing = 16
        containerStackV.distribution = .fill
        containerStackV.alignment = .fill
        containerStackV.axis = .vertical
        return containerStackV
    }()
    private lazy var btnStackV:UIStackView = {
        let btnStackV = UIStackView(arrangedSubviews: [containerStackV,okBtn])
        btnStackV.spacing = 16
        btnStackV.distribution = .fill
        btnStackV.alignment = .fill
        btnStackV.axis = .vertical
        return btnStackV
    }()
    private lazy var pStack:UIStackView = {
        let pStack = UIStackView(arrangedSubviews: [paymentLbl,cancelBtn])
        pStack.alignment = .fill
        pStack.spacing = 8
        pStack.axis = .horizontal
        pStack.distribution = .equalSpacing
        return pStackV
    }()
    private lazy var lastStack:UIStackView = {
        let lastStack = UIStackView(arrangedSubviews: [pStack,btnStackV])
        lastStack.spacing = 16
        lastStack.distribution = .fill
        lastStack.alignment = .fill
        lastStack.axis = .vertical
        return lastStack
    }()
    //    background Image
    private lazy var backImageV:UIImageView = {
        let i = UIImageView(image: UIImage(named: "cornerBack"))
        i.contentMode = .scaleAspectFill
        return i
        
    }()
    
    var dismissBtn:UIButton = {
        let b = UIButton()
        b.backgroundColor =  .clear
        b.addTarget(.none, action: #selector(cancelTapped), for: .touchUpInside)
        return b
    }()
    
    var continueIsTapped:((Bool)->Void)?
    
    //    ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
        view.backgroundColor = .black.withAlphaComponent(0.6)
        if cache.bool(forKey: "isDark") {
            backImageV.image = UIImage(named: "cornerBackDark")
            tfView.backgroundColor = #colorLiteral(red: 0.3662130833, green: 0.3764758408, blue: 0.4282612205, alpha: 1)
            paymeV.backgroundColor = #colorLiteral(red: 0.3662130833, green: 0.3764758408, blue: 0.4282612205, alpha: 1)
            clickV.backgroundColor = #colorLiteral(red: 0.3662130833, green: 0.3764758408, blue: 0.4282612205, alpha: 1)
        }else {
            backImageV.image = UIImage(named: "cornerBack")
        }
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.hero.isEnabled = true
        containerV.heroID = "btnView"
        containerV.backgroundColor = .clear
        containerV.hero.modifiers = [.scale(100)]
    }
    
//    Set Up UI
    func setUpUi(){
        
        
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        backgroundView.addSubview(dismissBtn)
        dismissBtn.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        IQKeyboardManager.shared().isEnabled = true
        containerV.backgroundColor = .clear
        containerV.addSubview(backImageV)
        backImageV.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        backV.addSubview(backImg)
        backImg.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        backV.addSubview(lblStack)
        lblStack.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
        }
        tfView.addSubview(txtField)
        txtField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(8)
        }
        paymeV.addSubview(paymeStack)
        paymeStack.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(16)
        }
        clickV.addSubview(clickStack)
        clickStack.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(16)
        }
        paymeV.addSubview(isPayme)
        isPayme.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        clickV.addSubview(isClick)
        isClick.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        containerV.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.left.top.equalTo(20)
            make.right.bottom.equalTo(-20)
        }
        backgroundView.addSubview(containerV)
        containerV.snp.makeConstraints { make in
            make.center.equalToSuperview()
            //            make.left.equalTo(16)
            //            make.right.equalTo(-16)
        }
        self.view.addGestureRecognizer (UITapGestureRecognizer(target: self, action: #selector (hideKeyboard)))
        setLang()
        observeLangNotif()
    }
//    viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
     


    }
//    keyboardWillShow
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo, let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        // Calculate the amount to adjust the view's height
        let adjustmentHeight = keyboardFrame.height
        
        // Animate the adjustment
        UIView.animate(withDuration: 0.3) {
            self.view.frame.size.height -= 2 * adjustmentHeight/3
        }
    }
//    keyboardWillHide
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let userInfo = notification.userInfo, let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        // Calculate the amount to adjust the view's height
        let adjustmentHeight = keyboardFrame.height
        
        // Animate the adjustment
        UIView.animate(withDuration: 0.3) {
            self.view.frame.size.height += 2 * adjustmentHeight/3
        }
    }

    //MARK: -  hide keyboard
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
    //    Select payments Method btn
    @objc func isPaymeTapped() {
        paymeSIM.image = UIImage(named: "true")
        clickSIM.image = UIImage(named: "false")
        
    }
    @objc func IsClickTapped() {
        paymeSIM.image = UIImage(named: "false")
        clickSIM.image = UIImage(named: "true")
    }
    
    //    Continue Tapped
    @objc func okTapped() {
        continueIsTapped?(true)
        self.dismiss(animated: true)
        
    }
    //    X tapped
    @objc func cancelTapped() {
        
        self.dismiss(animated: true)
        
    }
//    setLang
    func setLang(){
        textLbl.text = Lang.getString(type: .alertPLbl)
        okBtn.setTitle(Lang.getString(type: .continueBtn), for: .normal)
    }
    
    
    
}
//MARK: - NnotificationCenter for language changing
extension PaymentsVC {
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
