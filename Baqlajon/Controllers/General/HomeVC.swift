//
//  HomeVC.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    //    course payment view
    private lazy var backPaymentV:UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    private var myView:UIView = {
       let v = UIView()
        v.snp.makeConstraints { make in
            make.height.equalTo(170)
        }
        v.backgroundColor = .clear
        return v
    }()
        private lazy var imageV:UIImageView = {
           let i = UIImageView(image: UIImage(named: "Background 1"))
            i.contentMode = .scaleAspectFill
            i.clipsToBounds = true
            i.layer.cornerRadius = 10
            return i
        }()
        var titleLbl:UILabel = {
           let l = UILabel()
            l.text = "Lorem ipsum set"
            l.textColor = .white
            l.font = .appFont(ofSize: 22, weight: .medium)
            
            
            return l
        }()
        var textLbl:UILabel = {
           let l = UILabel()
            
            l.textColor = .white
            l.numberOfLines = 0
            l.text = "Pay 99 000 UZS & get all access for a month"
            l.font = .appFont(ofSize: 16)
            return l
        }()
        lazy var lblStack:UIStackView = {
           let s = UIStackView(arrangedSubviews: [titleLbl,textLbl])
            s.distribution = .fill
            s.axis = .vertical
            s.spacing = 8
            s.alignment = .leading
            return s
        }()
        var btnView:UIView = {
            let b = UIView()
            b.layer.cornerRadius = 8
            b.snp.makeConstraints { make in
                make.height.equalTo(36)
            }
            b.backgroundColor = .white
            return b
        }()
        private var lbl:UILabel = {
           let l = UILabel()
           
            l.textColor = .systemBlue
            l.text = "Buy Now"
            l.font = .appFont(ofSize: 14,weight: .medium)
            return l
        }()
        private var img:UIImageView = {
           let i = UIImageView()
            i.image = UIImage(systemName: "chevron.right",withConfiguration: UIImage.SymbolConfiguration(pointSize: 16))
            
            return i
        }()
        private lazy var btnStack:UIStackView = {
           let s = UIStackView(arrangedSubviews: [lbl,img])
            s.alignment = .center
            s.spacing = 8
            s.axis = .horizontal
            s.distribution = .fill
            return s
        }()
        var btn:UIButton = {
           let b = UIButton()
            b.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
            return b
        }()
        lazy var lblBStack:UIStackView = {
           let s = UIStackView(arrangedSubviews: [lblStack,btnView])
            s.distribution = .fill
            s.axis = .vertical
            s.spacing = 16
            s.alignment = .leading
            return s
        }()
        var fireLbl: UILabel = {
           let l = UILabel()
            l.font = .appFont(ofSize: 14)
            l.textColor = .black
            l.text = "🔥 Sotib olganlar:"
            return l
        }()
        var countLbl: UILabel = {
           let l = UILabel()
            l.font = .appFont(ofSize: 14,weight: .semiBold)
            l.textColor = .black
            l.text = "10000"
            return l
        }()
        lazy var yellowStack:UIStackView = {
           let s = UIStackView(arrangedSubviews: [fireLbl,countLbl])
            s.distribution = .fill
            s.axis = .horizontal
            s.spacing = 8
            s.alignment = .fill
            return s
        }()
        var yellowView:UIView = {
           let v = UIView()
            v.backgroundColor = #colorLiteral(red: 0.7612490654, green: 0.9437683225, blue: 0.3503981233, alpha: 1)
            v.layer.cornerRadius = 6
            return v
        }()
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .appColor(color: .background)
        setNavController()
        setUpUI()
    }
//setUpUI
    func setUpUI(){
        
        btnView.addSubview(btnStack)
        btnStack.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(16)
            make.top.right.equalToSuperview().inset(4)
            make.centerY.equalToSuperview()
        }
        btnView.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(0)
        }
        view.addSubview(myView)
        myView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
        }
        myView.addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(0)
        }
        myView.addSubview(lblBStack)
        lblBStack.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview().inset(16)
            
        }
        yellowView.addSubview(yellowStack)
        yellowStack.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(6)
        }
        view.addSubview(yellowView)
        yellowView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(myView.snp_bottomMargin).inset(0)
        }
    }
    
    
    
    //    SetNavController
        func setNavController() {
            navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white),font: .appFont(ofSize: 16,weight: .medium))
            let leftBtn = UIBarButtonItem(title: "Home", style: .done, target: self, action: .none)
            let rightButton = UIBarButtonItem(image:UIImage(named: "alert"), style: .done, target: self, action: #selector(alertTapped))
            navigationItem.rightBarButtonItem = rightButton
            navigationItem.leftBarButtonItem = leftBtn
            navigationItem.rightBarButtonItem?.tintColor =  .appColor(color: .black3)
            navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
            
        }
    
    @objc func alertTapped(){
        
    }
//    btnTapped
    @objc func btnTapped(){
        
        let vc = PaymentsVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
}
