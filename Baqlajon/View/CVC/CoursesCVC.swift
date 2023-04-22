//
//  CoursesCVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 31/03/23.
//

import UIKit
import SnapKit

class CoursesCVC: UICollectionViewCell {
    
    static let identifier = "CoursesCVC"
    lazy var  image: UIImageView = {
        let i = UIImageView()
         
        i.clipsToBounds = true
        i.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        i.layer.cornerRadius = 8
        i.contentMode = .scaleAspectFill
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
         l.numberOfLines = 0
         return l
     }()
  
     lazy var  starImage: UIImageView = {
         let i = UIImageView()
          i.image = UIImage(systemName: "star.fill")
         i.snp.makeConstraints { make in
             make.height.width.equalTo(16)
         }
         i.tintColor = #colorLiteral(red: 0.9998322129, green: 0.6800814271, blue: 0.1177380309, alpha: 1)
          return i
      }()
     var starLbl: UILabel = {
        let l = UILabel()
         l.font = .appFont(ofSize: 12)
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
         l.font = .appFont(ofSize: 12)
         l.textColor = #colorLiteral(red: 0.475826025, green: 0.4803363681, blue: 0.6001288295, alpha: 1)
         l.text = "6k"
         return l
     }()
 
     private lazy var starStackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [starImage,starLbl])
      
         s.spacing = 2
         s.axis = .horizontal
         s.alignment = .fill
         s.distribution = .fill
         
         return s
     }()
     private lazy var eyeStackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [eyeImage,eyeLbl])
         
         s.spacing = 2
         s.axis = .horizontal
         s.alignment = .fill
         s.distribution = .fill
         
         return s
     }()
     private lazy var eSstackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [starStackV,eyeStackV])
        
         s.spacing = 10
         s.axis = .horizontal
         s.alignment = .leading
         s.distribution = .fill
         
         return s
     }()
    
     private lazy var myBackV:UIView = {
        let v = UIView()
         v.backgroundColor = .appColor(color: .white)
         v.layer.cornerRadius = 8
         return v
     }()
    


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUI(){
        titleLbl.font = UIFont(name: "Poppins", size: 10)
        textLbl.font = UIFont(name: "Poppins", size: 14)
        myBackV.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(0)
            make.height.equalTo(90)
        }
        myBackV.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.left.equalTo(6)
            make.top.equalTo(image.snp_bottomMargin).inset(-10)
        }
        myBackV.addSubview(textLbl)
        textLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp_bottomMargin).inset(-6)
            make.left.right.equalToSuperview().inset(6)
        }
        myBackV.addSubview(eSstackV)
        eSstackV.snp.makeConstraints { make in
            make.top.equalTo(textLbl.snp_bottomMargin).inset(-10)
            make.left.equalTo(6)
        }
        self.contentView.addSubview(myBackV)
        myBackV.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(5)
        }
        contentView.backgroundColor = .appColor(color: .background)
    }
    
    func updateCell(course:GetCourseDM) {
        
        DispatchQueue.main.async {
            self.image.sd_setImage(with: URL(string: API.imgBaseURL + course.image)!)
        }
        
        titleLbl.text = course.title
        textLbl.text = course.desc
        starLbl.text = "\(course.rating)"
        eyeLbl.text = "\(course.viewCount)"
    }
    
    
    
}
