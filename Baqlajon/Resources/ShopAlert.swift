//
//  ShopAlert.swift
//  Baqlajon
//
//  Created by MacBook Pro on 05/04/23.
//

import UIKit
import SnapKit
import Lottie
class ShopAlert:UIView{
    static var lottieView:LottieAnimationView = {
        let v = LottieAnimationView()
        v.backgroundColor = .clear
        v.loopMode = .loop
        v.animation = LottieAnimation.named("not_money")
        
       return v
    }()
    
    class func showAlert(image:UIImage?,title:String,text:String){
        let backV = ShopAlert(frame: UIScreen.main.bounds)
            backV.backgroundColor = .black.withAlphaComponent(0.6)
        
        let dismissBtn: UIButton = {
           let b = UIButton()
            b.addTarget(.none, action: #selector(backV.okTapped), for: .touchUpInside)
            return b
        }()
        backV.addSubview(dismissBtn)
        dismissBtn.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        
        let star1:UIImageView = {
            let i = UIImageView()
            i.image = UIImage(named: "starImage")
            i.snp.makeConstraints { make in
                make.width.height.equalTo(7)
            }
            return i
        }()
        let star2:UIImageView = {
            let i = UIImageView()
            i.image = UIImage(named: "starImage")
            i.snp.makeConstraints { make in
                make.width.height.equalTo(16)
            }
            return i
        }()
        let star3:UIImageView = {
            let i = UIImageView()
            i.image = UIImage(named: "starImage")
            i.snp.makeConstraints { make in
                make.width.height.equalTo(10)
            }
            return i
        }()
        let star4:UIImageView = {
            let i = UIImageView()
            i.image = UIImage(named: "starImage")
            i.snp.makeConstraints { make in
                make.width.height.equalTo(11)
            }
            return i
        }()
        
        let containerV:UIView = {
            let v = UIView()
            v.backgroundColor = .appColor(color: .white)
            v.layer.cornerRadius = 8
            return v
        }()
        let image:UIImageView = {
            let i = UIImageView()
            i.contentMode = .scaleAspectFill
            if let image = image {
                i.image = image
            }
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
            b.layer.cornerRadius = 8
            b.snp.makeConstraints { make in
                make.height.equalTo(48)
            }
            b.addTarget(backV, action: #selector(backV.okTapped), for: .touchUpInside)
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
        
        
        
        
        containerV.addSubview(star1)
        star1.snp.makeConstraints { make in
            make.top.equalTo(62)
            make.left.equalTo(86)
        }
        containerV.addSubview(star2)
        star2.snp.makeConstraints { make in
            make.top.equalTo(55)
            make.right.equalTo(-88)
        }
        containerV.addSubview(star3)
        star3.snp.makeConstraints { make in
            make.top.equalTo(star1.snp_bottomMargin).inset(-88)
            make.left.equalTo(67)
        }
        containerV.addSubview(star4)
        star4.snp.makeConstraints { make in
            make.right.equalTo(-64)
            make.top.equalTo(star2.snp_bottomMargin).inset(-103)
        }
        containerV.addSubview(lottieView)
        lottieView.snp.makeConstraints { make in
            make.height.width.equalTo(180)
            make.top.equalTo(12)
            make.left.right.equalToSuperview().inset(66)
        }
        
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


