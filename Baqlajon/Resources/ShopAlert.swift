//
//  ShopAlert.swift
//  Baqlajon
//
//  Created by MacBook Pro on 05/04/23.
//

import UIKit
import SnapKit
class ShopAlert:UIView{
    
    class func showAlert(image:UIImage,title:String,text:String){
        let backV = ShopAlert(frame: UIScreen.main.bounds)
            backV.backgroundColor = .black.withAlphaComponent(0.6)
        
        let containerV:UIView = {
            let v = UIView()
            v.backgroundColor = .appColor(color: .white)
            return v
        }()
        let image:UIImageView = {
            let i = UIImageView()
            i.contentMode = .scaleAspectFill
            i.image = UIImage(named: "AlertImage")
            i.snp.makeConstraints { make in
                make.height.equalTo(150)
            }
            return i
        }()
        let titleLbl:UILabel = {
            let l = UILabel()
            l.text = title
            l.font = .appFont(ofSize: 16,weight: .medium)
            l.textColor = .appColor(color: .black1)
            l.textAlignment =  .center
            return l
        }()
        let textLbl:UILabel = {
            let l = UILabel()
            l.text = text
            l.font = .appFont(ofSize: 14)
            l.textColor = .appColor(color: .black3)
            l.textAlignment = .center
            l.numberOfLines = 2
            return l
        }()
        let btn:UIButton = {
            let b = UIButton()
            b.setTitle("Ok", for: .normal)
            b.backgroundColor = .appColor(color: .mainBlue)
            b.setTitleColor(.white, for: .normal)
            b.snp.makeConstraints { make in
                make.height.equalTo(48)
            }
            b.addTarget(self, action: #selector(okTapped), for: .touchUpInside)
            return b
        }()
        
        let lblStack:UIStackView = {
            let s = UIStackView(arrangedSubviews: [titleLbl,textLbl])
            s.axis = .vertical
            s.spacing = 16
            s.alignment = .fill
            s.distribution = .fill
            return s
        }()
        let btnStack:UIStackView = {
            let s = UIStackView(arrangedSubviews: [lblStack,btn])
            s.axis = .vertical
            s.spacing = 24
            s.alignment = .fill
            s.distribution = .fill
            return s
        }()
        let imageStackV:UIStackView = {
            let i = UIStackView(arrangedSubviews: [image,btnStack])
            i.axis = .vertical
            i.spacing = 24
            i.alignment = .fill
            i.distribution = .fill
            return i
        }()
        
        containerV.addSubview(imageStackV)
        imageStackV.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(19)
            make.top.bottom.equalToSuperview().inset(30)
        }
        backV.addSubview(containerV)
        containerV.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(32)
            make.center.equalTo(backV.center)
        }
        
        containerV.transform = .init(scaleX: 0, y: 0)
        if let window = UIApplication.keyWindow {
            window.addSubview(backV)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [.curveEaseOut]) {
            containerV.transform = .identity
        }
        
        
        
    }
    @objc func okTapped() {
        
        self.removeFromSuperview()
    }
    
    
    
}


