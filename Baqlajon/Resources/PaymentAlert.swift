//
//  PaymentAlert.swift
//  Baqlajon
//
//  Created by MacBook Pro on 23/04/23.
//

import UIKit
import SnapKit

class ClickJobsAlert: UIView {
    
    var completion: ((Bool?,Bool?)->Void)?
    
    static var clickSIM = UIImageView(image: UIImage(named: "false"))
    static var paymeSIM = UIImageView(image: UIImage(named: "false"))
    static func showAlert(completion: ((Bool?,Bool?) -> Void)?) {
        
        
        let backgroudView = ClickJobsAlert(frame: UIScreen.main.bounds)
        backgroudView.backgroundColor = .black.withAlphaComponent(0.6)
        backgroudView.completion = completion
        
//        dismissBtn
        let dismissBtn = UIButton()
        dismissBtn.addTarget(.none, action: #selector(ClickJobsAlert.cancelTapped), for: .touchUpInside)
        backgroudView.addSubview(dismissBtn)
        dismissBtn.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        

        // containerView
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
//        BackgroundImage
        let backgroundImg = UIImageView()
        backgroundImg.contentMode = .scaleAspectFill
        
        
        // paymentLbl
        let titleLbl = UILabel()
        titleLbl.font = .appFont(ofSize: 16,weight: .medium)
        titleLbl.text = "Payment"
        titleLbl.textAlignment = .center
        titleLbl.textColor = .appColor(color: .black1)
        
        // summLbl
        let messLbl = UILabel()
        messLbl.text = "99.000"
        messLbl.textColor = .white
        messLbl.font = .appFont(ofSize: 22,weight: .medium)
        
//        textLbl
        let textLbl = UILabel()
        textLbl.text = "/ For a month"
        textLbl.textColor = .white
        textLbl.font = .appFont(ofSize: 16)
        
        // okBtn
        let okBtn = UIButton()
        okBtn.backgroundColor = .appColor(color: .mainBlue)
        okBtn.setTitle("Continue", for: .normal)
        okBtn.titleLabel?.font = .appFont(ofSize: 16,weight: .medium)
        okBtn.setTitleColor(.white, for: .normal)
        okBtn.addTarget(backgroudView, action: #selector(backgroudView.okTapped), for: .touchUpInside)
        okBtn.layer.cornerRadius = 10
        okBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        // cancelBtn
        let cancelBtn = UIButton()
        cancelBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelBtn.tintColor = .appColor(color: .gray3)
        cancelBtn.addTarget(backgroudView, action: #selector(backgroudView.cancelTapped), for: .touchUpInside)
//        txtFieldV
        let txtFieldV = UIView()
        txtFieldV.backgroundColor = .appColor(color: .gray7)
        txtFieldV.layer.cornerRadius = 10
        txtFieldV.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
//        txtField
        let txtField = UITextField()
        txtField.placeholder = "Referral code"
        txtField.backgroundColor = .clear
        txtField.textColor = .black
//        clickV
        let clickV = UIView()
        clickV.backgroundColor = .appColor(color: .gray7)
        clickV.layer.cornerRadius = 10
//        clickIM
        let clickIM = UIImageView(image: UIImage(named: "Click"))
//        clickSIM
      
//        paymeV
        let paymeV = UIView()
        paymeV.backgroundColor = .appColor(color: .gray7)
        paymeV.layer.cornerRadius = 10
//        paymeIM
        let paymeIM = UIImageView(image: UIImage(named: "Pay me"))
//        paymeSIM
     
//        Click Button
        let isClick = UIButton()
        isClick.addTarget(.none, action: #selector(ClickJobsAlert.IsClickTapped), for: .touchUpInside)
//        Payme Button
        let isPayme = UIButton()
        isPayme.addTarget(.none, action: #selector(ClickJobsAlert.isPaymeTapped), for: .touchUpInside)
//        BackV
        let backV = UIView()
        backV.backgroundColor = .clear
        backV.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
//        BackImage
        let backImage = UIImageView(image: UIImage(named: "PaymentsBack"))
        backImage.contentMode = .scaleAspectFill
        backImage.backgroundColor = .clear
        backImage.tintColor = .black
//        lblStack
        let lblStack = UIStackView(arrangedSubviews: [messLbl,textLbl])
        lblStack.alignment = .fill
        lblStack.spacing = 8
        lblStack.axis = .horizontal
        lblStack.distribution = .fill
//        paymeStack
        let paymeStack = UIStackView(arrangedSubviews: [paymeIM,paymeSIM])
        paymeStack.distribution = .equalSpacing
        paymeStack.axis = .horizontal
        paymeStack.spacing = 24
        paymeStack.alignment = .fill
//        clickStack
        let clickStack = UIStackView(arrangedSubviews: [clickIM,clickSIM])
        clickStack.distribution = .equalSpacing
        clickStack.axis = .horizontal
        clickStack.spacing = 24
        clickStack.alignment = .fill
//        sttackV
        let sttackV = UIStackView(arrangedSubviews: [paymeV,clickV])
        sttackV.alignment = .fill
        sttackV.spacing = 16
        sttackV.axis = .horizontal
        sttackV.distribution = .equalSpacing
        
        let pStackV = UIStackView(arrangedSubviews: [titleLbl,cancelBtn])
        pStackV.alignment = .fill
        pStackV.spacing = 8
        pStackV.axis = .horizontal
        pStackV.distribution = .equalSpacing
        
        
        
        
        
        // containerStackView
        let containerStackV = UIStackView(arrangedSubviews: [backV,txtFieldV,sttackV])
        containerStackV.spacing = 10
        containerStackV.distribution = .fill
        containerStackV.alignment = .fill
        containerStackV.axis = .vertical
        
        // btnStackView
        let btnStackV = UIStackView(arrangedSubviews: [containerStackV,okBtn])
        btnStackV.spacing = 16
        btnStackV.distribution = .fill
        btnStackV.alignment = .fill
        btnStackV.axis = .vertical
//        lastStack
        let lastStack = UIStackView(arrangedSubviews: [pStackV,btnStackV])
        lastStack.spacing = 16
        lastStack.distribution = .fill
        lastStack.alignment = .fill
        lastStack.axis = .vertical
        
        containerView.addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        backV.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        backV.addSubview(lblStack)
        lblStack.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
        }
        txtFieldV.addSubview(txtField)
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
        containerView.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.right.bottom.equalTo(-20)
        }
        
        
        if cache.bool(forKey: "isDark") {
            backgroundImg.image = UIImage(named: "cornerBackDark")
            txtFieldV.backgroundColor = #colorLiteral(red: 0.3662130833, green: 0.3764758408, blue: 0.4282612205, alpha: 1)
            paymeV.backgroundColor = #colorLiteral(red: 0.3662130833, green: 0.3764758408, blue: 0.4282612205, alpha: 1)
            clickV.backgroundColor = #colorLiteral(red: 0.3662130833, green: 0.3764758408, blue: 0.4282612205, alpha: 1)
        }else {
            backgroundImg.image = UIImage(named: "cornerBack")
        }
        
        backgroudView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.center.equalTo(backgroudView.center)
            make.height.equalTo(350)
            make.width.equalTo(344)
        }
        
        
        
        
        containerView.transform = .init(scaleX: 1.5, y: 1.5)
        
        if let window = UIApplication.keyWindow {
            window.addSubview(backgroudView)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: [.curveEaseOut]) {
            containerView.transform = .identity
        }
        
        
    }
    
    
    @objc func okTapped() {
        completion?(true, nil)
        self.dismissView()
    }
    
    @objc func cancelTapped() {
        completion?(false, nil)
        self.dismissView()
    }
    
    //    Select payments Method btn
    @objc func isPaymeTapped() {
        ClickJobsAlert.paymeSIM.image = UIImage(named: "true")
        ClickJobsAlert.clickSIM.image = UIImage(named: "false")
        
    }
    @objc func IsClickTapped() {
        ClickJobsAlert.paymeSIM.image = UIImage(named: "false")
        ClickJobsAlert.clickSIM.image = UIImage(named: "true")
    }
    
    
    func dismissView() {
        self.removeFromSuperview()
        
    }
    
    
    
}
