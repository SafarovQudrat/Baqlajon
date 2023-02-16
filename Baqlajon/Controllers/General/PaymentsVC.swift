//
//  PaymentsVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 09/02/23.
//

import UIKit

class PaymentsVC: UIViewController {
//constants
    private lazy var containerV:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    private lazy var paymentLbl:UILabel = {
        let titleLbl = UILabel()
        titleLbl.font = .appFont(ofSize: 16,weight: .medium)
        titleLbl.text = "Payment"
        titleLbl.textAlignment = .center
        titleLbl.textColor = #colorLiteral(red: 0.1727883816, green: 0.1765024364, blue: 0.2653855383, alpha: 1)
        return titleLbl
    }()
    private lazy var cancelBtn:UIButton = {
        let cancelBtn = UIButton()
        cancelBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelBtn.tintColor = #colorLiteral(red: 0.7062321305, green: 0.7086142898, blue: 0.7779026031, alpha: 1)
        cancelBtn.addTarget(.none, action: #selector(cancelTapped), for: .touchUpInside)
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
        let backImage = UIImageView(image: UIImage(named: "paymentsBack"))
        backImage.contentMode = .scaleAspectFill
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
        txtView.backgroundColor = #colorLiteral(red: 0.9719608426, green: 0.9722560048, blue: 0.9813567996, alpha: 1)
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
        return txtField
    }()
//    Continue Btn
    private lazy var okBtn:UIButton = {
        let okBtn = UIButton()
        okBtn.backgroundColor = .systemBlue
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
        v.backgroundColor = #colorLiteral(red: 0.9719608426, green: 0.9722560048, blue: 0.9813567996, alpha: 1)
        v.layer.cornerRadius = 10
        return v
    }()
    private var clickV:UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9719608426, green: 0.9722560048, blue: 0.9813567996, alpha: 1)
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
        btnStackV.spacing = 24
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
      lastStack.spacing = 24
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
//    ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.6)
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
        view.addSubview(containerV)
        containerV.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        containerV.transform = .init(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [.curveEaseOut]) { [self] in
            containerV.transform = .identity
        }
        
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

        self.dismiss(animated: false)
        
    }
//    X tapped
    @objc func cancelTapped() {
        
        self.dismiss(animated: false)
        
    }
    
    

   
}
