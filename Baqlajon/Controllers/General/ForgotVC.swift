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
    let textLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please enter your registered phone number to reset your password!"
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
        tf.keyboardType = .numberPad
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
        view.backgroundColor = .systemBackground
        navSettings()
        setUIItems()
    }
    
    
    //MARK: Navigation Settings
    func navSettings() {
        title = "Forgot Password"
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
    
}



//MARK: -objc functions-
extension ForgotVC {
    
    @objc func sendCodeTapped() {
        let vc = ResetPasswordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
