//
//  ProfileTVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 12/02/23.
//

import UIKit
import SnapKit
class ProfileTVC: UITableViewCell {

    lazy var img:UIImageView = {
       let i = UIImageView()
        i.backgroundColor = #colorLiteral(red: 0, green: 0.6406018734, blue: 0.9510455728, alpha: 0.1)
        i.clipsToBounds = true
        i.layer.cornerRadius = 4
        i.image = UIImage(systemName: "creditcard",withConfiguration: UIImage.SymbolConfiguration(pointSize: 15))
        i.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        return i
    }()
    lazy var lbl:UILabel = {
       let l = UILabel()
        l.textColor = .appColor(color: .black1)
        l.font = .appFont(ofSize: 14)
        return l
    }()
    lazy var textLbl:UILabel = {
        let l = UILabel()
        l.font = .appFont(ofSize: 12)
        l.textColor = .appColor(color: .gray1)
        return l
    }()
    lazy var mySwitch:UISwitch = {
       let s = UISwitch()
        s.setOn(false, animated: true)
        return s
    }()
    lazy var btn:UIButton = {
       let b = UIButton()
        b.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        b.tintColor = .appColor(color: .gray1)
        b.backgroundColor = .clear
        return b
    }()
    
    private lazy var imageStack:UIStackView = {
       let s = UIStackView(arrangedSubviews: [img,lbl])
        s.alignment = .fill
        s.spacing = 8
        s.distribution = .fill
        s.axis = .horizontal
        return s
    }()
    private lazy var btnStackV:UIStackView = {
       let s = UIStackView(arrangedSubviews: [textLbl,mySwitch,btn])
        s.axis = .horizontal
        s.distribution = .equalCentering
        s.spacing = 8
        s.alignment = .fill
        return s
    }()
    private lazy var lastStack:UIStackView = {
       let s = UIStackView(arrangedSubviews: [imageStack,btnStackV])
        s.alignment = .fill
        s.spacing = 0
        s.distribution = .equalSpacing
        s.axis = .horizontal
        return s
        
    }()
    
    private lazy var backView:UIView = {
       let v = UIView()
        v.backgroundColor = .systemBackground
        return v
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backView.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview().inset(10)
        }
        contentView.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalTo(0)
            
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(data:MyData) {
        img.image = data.img
        lbl.text = data.title
        textLbl.text = data.text ?? ""
        
        if  data.isSwitchON  {
            mySwitch.isHidden = false
            btn.isHidden = true
        } else {
            mySwitch.isHidden = true
            btn.isHidden = false
        }
        if mySwitch.isOn {
            
            
        } else {
           
        }
       
    }
    
    
    
    
}
