//
//  CustomAlert.swift
//  Cache_Lesson_39
//
//  Created by Asliddin Mahmudov on 03/12/22.
//

import UIKit
import SnapKit

class ClickJobsAlert: UIView {
    
    var completion: ((Bool)->Void)?
    
    static func showAlert(cost: String, completion: ((Bool) -> Void)?) {
        
        
        let backgroudView = ClickJobsAlert(frame: UIScreen.main.bounds)
        backgroudView.backgroundColor = .black.withAlphaComponent(0.6)
        backgroudView.completion = completion

        // containerView
        let containerView = UIView()

        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // paymentLbl
        let titleLbl = UILabel()
        titleLbl.font = .appFont(ofSize: 16,weight: .medium)
        titleLbl.text = "Payment"
        titleLbl.textAlignment = .center
        titleLbl.textColor = #colorLiteral(red: 0.1727883816, green: 0.1765024364, blue: 0.2653855383, alpha: 1)
        
        
        // cancelBtn
        let cancelBtn = UIButton()
        cancelBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelBtn.tintColor = #colorLiteral(red: 0.7062321305, green: 0.7086142898, blue: 0.7779026031, alpha: 1)
        cancelBtn.addTarget(backgroudView, action: #selector(backgroudView.cancelTapped), for: .touchUpInside)
        
//        paymentStack
        
        let pStack = UIStackView(arrangedSubviews: [titleLbl,cancelBtn])
        pStack.alignment = .fill
        pStack.spacing = 8
        pStack.axis = .horizontal
        pStack.distribution = .equalSpacing
        
//        backVVV
        let backV = UIView()
        backV.backgroundColor = .clear
        backV.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        
        
//        backimg
        let backImage = UIImageView(image: UIImage(named: "paymantBack"))
        backImage.contentMode = .scaleAspectFill
        
        
        // SummLbl
        let messLbl = UILabel()
        messLbl.text = cost
        messLbl.textColor = .white
        messLbl.font = .appFont(ofSize: 22,weight: .medium)
//        txtLbl
        let txt = UILabel()
        txt.text = "/ For a month"
        txt.textColor = .white
        txt.font = .appFont(ofSize: 16)
        
        
        
//        lblStack
        let lblStack = UIStackView(arrangedSubviews: [messLbl,txt])
        lblStack.alignment = .fill
        lblStack.spacing = 8
        lblStack.axis = .horizontal
        lblStack.distribution = .fill
        
        backV.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        backV.addSubview(lblStack)
        lblStack.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
        }
        
        
        
        
        
        let txtView = UIView()
        txtView.backgroundColor = #colorLiteral(red: 0.9719608426, green: 0.9722560048, blue: 0.9813567996, alpha: 1)
        txtView.layer.cornerRadius = 10
        txtView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
//        txtField
        let txtField = UITextField()
        txtField.placeholder = "Referral code"
        txtField.backgroundColor = .clear
        
        
        
        txtView.addSubview(txtField)
        txtField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(8)
        }
        
        
        
        
        
        
        // okBtn
        let okBtn = UIButton()
        okBtn.backgroundColor = .systemBlue
        okBtn.setTitle("Continue", for: .normal)
        okBtn.titleLabel?.font = .appFont(ofSize: 16,weight: .medium)
        okBtn.setTitleColor(.white, for: .normal)
        okBtn.addTarget(backgroudView, action: #selector(backgroudView.okTapped), for: .touchUpInside)
        okBtn.layer.cornerRadius = 10
        okBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
       
        
//        PAY ME
        let paymeV = UIView()
        paymeV.backgroundColor = #colorLiteral(red: 0.9719608426, green: 0.9722560048, blue: 0.9813567996, alpha: 1)
        paymeV.layer.cornerRadius = 10
        
        
        let paymeIM = UIImageView(image: UIImage(named: "Pay me"))
         let  paymeSIM = UIImageView(image: UIImage(named: "false"))
        
        
        let paymeStack = UIStackView(arrangedSubviews: [paymeIM, paymeSIM])
        paymeStack.distribution = .equalSpacing
        paymeStack.axis = .horizontal
        paymeStack.spacing = 16
        paymeStack.alignment = .fill
        
        let isPayme = UIButton()
        isPayme.addTarget(.none, action: #selector(backgroudView.isPaymeTapped), for: .touchUpInside)
        
        paymeV.addSubview(paymeStack)
        paymeStack.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview().inset(16)
        }
        
        paymeV.addSubview(isPayme)
        isPayme.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
//        CLICK
        let clickV = UIView()
        clickV.backgroundColor = #colorLiteral(red: 0.9719608426, green: 0.9722560048, blue: 0.9813567996, alpha: 1)
        clickV.layer.cornerRadius = 10
        
        
        let clickIM = UIImageView(image: UIImage(named: "Click"))
         let  clickSIM = UIImageView(image: UIImage(named: "false"))
        
        let clickStack = UIStackView(arrangedSubviews: [clickIM,clickSIM])
        clickStack.distribution = .equalCentering
        clickStack.axis = .horizontal
        clickStack.spacing = 16
        clickStack.alignment = .fill
        
        let isClick = UIButton()
        isClick.addTarget(.none, action: #selector(backgroudView.IsClickTapped), for: .touchUpInside)
        
        clickV.addSubview(clickStack)
        clickStack.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview().inset(16)
        }
        
        clickV.addSubview(isClick)
        isClick.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        
//        Payments stack
        
        let sttackV = UIStackView(arrangedSubviews: [paymeV,clickV])
         
        sttackV.alignment = .fill
        sttackV.spacing = 16
        sttackV.axis = .horizontal
        sttackV.distribution = .fillEqually
         
        // containerStackView
        let containerStackV = UIStackView(arrangedSubviews: [backV,txtView,sttackV])
        containerStackV.spacing = 16
        containerStackV.distribution = .fill
        containerStackV.alignment = .fill
        containerStackV.axis = .vertical
        
        // btnStackView
        let btnStackV = UIStackView(arrangedSubviews: [containerStackV,okBtn])
        btnStackV.spacing = 24
        btnStackV.distribution = .fill
        btnStackV.alignment = .fill
        btnStackV.axis = .vertical
        
        let lastStack = UIStackView(arrangedSubviews: [pStack,btnStackV])
      lastStack.spacing = 24
      lastStack.distribution = .fill
      lastStack.alignment = .fill
      lastStack.axis = .vertical
        
        containerView.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.left.top.equalTo(20)
            make.right.bottom.equalTo(-20)
        }

        backgroudView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }

        
        containerView.transform = .init(scaleX: 0, y: 0)
        
        if let window = UIApplication.keyWindow {
            window.addSubview(backgroudView)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [.curveEaseOut]) {
            containerView.transform = .identity
        }
        
       
        
        
        
        
    }
    
    @objc func isPaymeTapped() {
        completion?(true)
        
    }
    
    
    @objc func IsClickTapped() {
        completion?(false)
    }
   
    
    
    
    
    @objc func okTapped() {

        self.dismissView()
        
    }
    
    @objc func cancelTapped() {
        
        self.dismissView()
        
    }
    
    
    func dismissView() {
        self.removeFromSuperview()
        
    }
    
    
    
}
