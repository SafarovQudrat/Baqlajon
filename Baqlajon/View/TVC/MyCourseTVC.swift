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
       i.contentMode = .scaleAspectFill
       i.clipsToBounds = true
       i.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
       i.layer.cornerRadius = 8
        return i
    }()
    var titleLbl: UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 10)
        l.textColor = .systemGray2
        l.text = "Mobilograf"
        return l
    }()
    var textLbl: UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 12)
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
        l.textColor = .appColor(color: .black1)
        l.text = "10/14"
        l.font = .appFont(ofSize: 14)
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
            make.height.width.equalTo(12)
        }
         return i
     }()
    var starLbl: UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 12)
        l.textColor = .appColor(color: .gray5)
        l.text = "4.5"
        return l
    }()
    lazy var  eyeImage: UIImageView = {
        let i = UIImageView()
         i.image = UIImage(systemName: "eye")
        i.tintColor = .appColor(color: .gray5)
        i.snp.makeConstraints { make in
            make.height.width.equalTo(12)
        }
         return i
     }()
    var eyeLbl: UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 12)
        l.textColor = .appColor(color: .gray5)
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
            make.width.equalTo(90)
            make.height.equalTo(100)
        }
        backV.addSubview(progressV)
        backV.backgroundColor = .appColor(color: .gray6)
        progressV.backgroundColor = .appColor(color: .mainBlue)
        myBackV.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(image.snp_rightMargin).inset(-12)
        }
        myBackV.addSubview(textLbl)
        textLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp_bottomMargin).inset(-10)
            make.left.equalTo(image.snp_rightMargin).inset(-12)
            make.right.equalTo(-10)
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
    
    func updateCell(course:MyAllCourseDM) {
        DispatchQueue.main.async {
            self.image.sd_setImage(with: URL(string: API.imgBaseURL + course.videos.image)!)
        }
        
        titleLbl.text = course.videos.title
        textLbl.text = course.videos.desc
        
        starLbl.text = "\(course.videos.rating)"
        eyeLbl.text = "\(course.videos.viewCount)"
    }
    
    
    

}
