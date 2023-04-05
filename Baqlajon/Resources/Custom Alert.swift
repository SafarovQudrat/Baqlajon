//
//  CustomAlert.swift
//  Cache_Lesson_39
//
//  Created by Asliddin Mahmudov on 03/12/22.
//

import UIKit
import SnapKit

class CustomAlert: UIView {
    
    var completion: ((Bool)->Void)?
    
    class func showAlert(title: String, message: String, completion: ((Bool) -> Void)?) {
        
        
        let backgroudView = CustomAlert(frame: UIScreen.main.bounds)
        backgroudView.backgroundColor = .gray.withAlphaComponent(0.6)
        backgroudView.completion = completion

        // containerView
        let containerView = UIView()

        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // titleLbl
        let titleLbl = UILabel()
        titleLbl.font = .boldSystemFont(ofSize: 22)
        titleLbl.text = title
        titleLbl.textAlignment = .center
        titleLbl.textColor = .black
        
        // messageLbl
        let messLbl = UILabel()
        messLbl.text = message
        messLbl.textColor = .black
        messLbl.textAlignment = .center
        messLbl.font = .systemFont(ofSize: 20)
        messLbl.numberOfLines = 0
        messLbl.snp.contentCompressionResistanceVerticalPriority = .greatestFiniteMagnitude
        // okBtn
        let okBtn = UIButton()
        okBtn.backgroundColor = .systemBlue
        okBtn.setTitle("Ok", for: .normal)
        okBtn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        okBtn.setTitleColor(.white, for: .normal)
        okBtn.addTarget(backgroudView, action: #selector(backgroudView.okTapped), for: .touchUpInside)
        okBtn.layer.cornerRadius = 10
        
        // cancelBtn
        let cancelBtn = UIButton()
        cancelBtn.backgroundColor = .systemGray
        cancelBtn.setTitle("Cancel", for: .normal)
        cancelBtn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        cancelBtn.setTitleColor(.white, for: .normal)
        cancelBtn.addTarget(backgroudView, action: #selector(backgroudView.cancelTapped), for: .touchUpInside)
        cancelBtn.layer.cornerRadius = 10
        
        // containerStackView
        let containerStackV = UIStackView()
        containerStackV.spacing = 10
        containerStackV.distribution = .fill
        containerStackV.alignment = .fill
        containerStackV.axis = .vertical
        
        // btnStackView
        let btnStackV = UIStackView()
        btnStackV.spacing = 20
        btnStackV.distribution = .fillEqually
        btnStackV.alignment = .fill
        btnStackV.axis = .horizontal
        
        
//        addSubViews
        
        btnStackV.addArrangedSubview(cancelBtn)
        btnStackV.addArrangedSubview(okBtn)
        
        okBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        containerStackV.addArrangedSubview(titleLbl)
        containerStackV.addArrangedSubview(messLbl)
        containerStackV.addArrangedSubview(btnStackV)
        
        containerView.addSubview(containerStackV)
        containerStackV.snp.makeConstraints { make in
            make.left.top.equalTo(20)
            make.right.bottom.equalTo(-20)
        }
        
        backgroudView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        


        
        containerView.transform = .init(scaleX: 0, y: 0)
        
        if let window = UIApplication.keyWindow {
            window.addSubview(backgroudView)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [.curveEaseOut]) {
            containerView.transform = .identity
        }
        
        
    }
    
    
    @objc func okTapped() {
        completion?(true)
        self.dismissView()
    }
    
    @objc func cancelTapped() {
        completion?(false)
        self.dismissView()
    }
    
    
    func dismissView() {
        self.removeFromSuperview()
        
    }
    
    
    
}



class Alert:UIView {
    class func showAlert(title:String,message:String,vc:UIViewController){
        let alertvc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel)
       alertvc.addAction(cancel)
        vc.present(alertvc, animated: true)
    }
}
