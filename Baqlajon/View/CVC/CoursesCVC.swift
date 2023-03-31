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
         i.image = UIImage(named: "courseImage")
        i.clipsToBounds = true
        i.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
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
         l.font = .appFont(ofSize: 14)
         l.text = "Social media marketing"
         l.numberOfLines = 2
         return l
     }()
  
     private lazy var mStackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [titleLbl,textLbl])
         s.spacing = 2
         s.axis = .vertical
         s.alignment = .fill
         s.distribution = .fill
         return s
     }()
     
     
     lazy var  starImage: UIImageView = {
         let i = UIImageView()
          i.image = UIImage(systemName: "star.fill")
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
         s.distribution = .fillEqually
         
         return s
     }()
     private lazy var eyeStackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [eyeImage,eyeLbl])
         
         s.spacing = 2
         s.axis = .horizontal
         s.alignment = .fill
         s.distribution = .fillEqually
         
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
     private lazy var nStackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [mStackV,eSstackV])
         s.spacing = 6
         s.axis = .vertical
         s.alignment = .leading
         s.distribution = .fill
         return s
     }()
     private lazy var fStackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [image,nStackV])
         s.spacing = 6
         s.axis = .vertical
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
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setUI()
//    }

    
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
        image.snp.makeConstraints { make in
            make.height.equalTo(90)
        }
        myBackV.addSubview(fStackV)
        fStackV.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(0)
            make.left.right.equalToSuperview().inset(6)
            make.bottom.equalTo(-8)
        }
        self.contentView.addSubview(myBackV)
        myBackV.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(5)
        }
        contentView.backgroundColor = .appColor(color: .background)
    }
    
    
}
