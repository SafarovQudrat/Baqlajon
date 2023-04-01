//
//  MyCourseTVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 07/02/23.
//

import UIKit
import SnapKit
class MyCourseTVC: UITableViewCell {
    
    static let identifier = "MyCourseTVC"

   lazy var  image: UIImageView = {
       let i = UIImageView()
        i.image = UIImage(named: "courseImage")
       i.clipsToBounds = true
       i.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
       i.layer.cornerRadius = 8
        return i
    }()
    var titleLbl: UILabel = {
       let l = UILabel()
       
        l.textColor = .systemGray2
        l.text = "Mobilograf"
        return l
    }()
    var textLbl: UILabel = {
       let l = UILabel()
        l.font = UIFont(name: "System ", size: 14)
        l.text = "Social media marketing"
        return l
    }()
   lazy var backV: UIView = {
       let v = UIView()
       
       v.layer.cornerRadius = 6
        
      
        return v
    }()
   lazy var progressV: UIView = {
       let v = UIView()
     
       v.layer.cornerRadius = 6
       
        return v
    }()
    var taskLbl: UILabel = {
       let l = UILabel()
        
        l.text = "10/14"
        return l
    }()
    private lazy var stackV: UIStackView = {
       let s = UIStackView(arrangedSubviews: [backV,taskLbl])
       
        s.spacing = 8
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fill
        
        return s
    }()
    
    
    lazy var  starImage: UIImageView = {
        let i = UIImageView()
         i.image = UIImage(systemName: "star.fill")
        i.tintColor = #colorLiteral(red: 0.9998322129, green: 0.6800814271, blue: 0.1177380309, alpha: 1)
        i.snp.makeConstraints { make in
            make.height.width.equalTo(16)
        }
         return i
     }()
    var starLbl: UILabel = {
       let l = UILabel()
        l.font = UIFont(name: "System ", size: 12)
        l.textColor = #colorLiteral(red: 0.475826025, green: 0.4803363681, blue: 0.6001288295, alpha: 1)
        l.text = "4.5"
        return l
    }()
    lazy var  eyeImage: UIImageView = {
        let i = UIImageView()
         i.image = UIImage(systemName: "eye")
        i.tintColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.5294117647, alpha: 1)
        i.snp.makeConstraints { make in
            make.height.width.equalTo(16)
        }
         return i
     }()
    var eyeLbl: UILabel = {
       let l = UILabel()
        l.font = UIFont(name: "System ", size: 12)
        l.textColor = #colorLiteral(red: 0.475826025, green: 0.4803363681, blue: 0.6001288295, alpha: 1)
        l.text = "6k"
        return l
    }()
    
    
    private lazy var starStackV: UIStackView = {
       let s = UIStackView(arrangedSubviews: [starImage,starLbl])
     
        s.spacing = 5
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fill
        
        return s
    }()
    private lazy var eyeStackV: UIStackView = {
       let s = UIStackView(arrangedSubviews: [eyeImage,eyeLbl])
        
        s.spacing = 5
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fill
        
        return s
    }()
    private lazy var eSstackV: UIStackView = {
       let s = UIStackView(arrangedSubviews: [starStackV,eyeStackV])
       
        s.spacing = 18
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fill
        
        return s
    }()
   
    private lazy var myBackV:UIView = {
       let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 8
        return v
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLbl.font = .appFont(ofSize: 10)
        textLbl.font = .appFont(ofSize: 14)
        taskLbl.font = .appFont(ofSize: 14)
        backV.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(contentView.frame.width/2 - 16)
        }
        progressV.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(110)
        }
        myBackV.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(0)
            make.width.equalTo(120)
            make.height.equalTo(100)
        }
        backV.addSubview(progressV)
        backV.backgroundColor = #colorLiteral(red: 0.964705646, green: 0.9647061229, blue: 0.9776162505, alpha: 1)
        progressV.backgroundColor = #colorLiteral(red: 0, green: 0.5753021836, blue: 0.9667152762, alpha: 1)
        myBackV.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(image.snp_rightMargin).inset(-12)
        }
        myBackV.addSubview(textLbl)
        textLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp_bottomMargin).inset(-10)
            make.left.equalTo(image.snp_rightMargin).inset(-12)
        }
        myBackV.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.left.equalTo(image.snp_rightMargin).inset(-12)
            make.top.equalTo(textLbl.snp_bottomMargin).inset(-12)
        }
        myBackV.addSubview(eSstackV)
        eSstackV.snp.makeConstraints { make in
            make.left.equalTo(image.snp_rightMargin).inset(-12)
            make.top.equalTo(stackV.snp_bottomMargin).inset(-10)
        }
        

        self.contentView.addSubview(myBackV)
        myBackV.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(5)
        }
        contentView.backgroundColor = .appColor(color: .background)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
