//
//  BalanceVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 17/02/23.
//

import UIKit

class BalanceVC: UIViewController {
//    BackV
    private lazy var backV: UIView = {
       let v = UIView()
        v.backgroundColor = .clear
        v.snp.makeConstraints { make in
            make.height.equalTo(167)
        }
        return v
    }()
//    BackImage
    private lazy var backImage: UIImageView = {
       let i = UIImageView()
        i.image = UIImage(named: "balanceBackImg")
        i.clipsToBounds = true
        i.layer.cornerRadius = 10
        return i
    }()
// titleLbl
    private lazy  var titleLbl: UILabel = {
       let l = UILabel()
        l.textColor = .white
        l.font = .appFont(ofSize: 16,weight: .medium)
        l.text = "To’lov qiling va ball to’plang, to'plagan ballaringizni istalgan narsangizga almashtiring"
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
//    btn
    private lazy var buyBtn: UIButton = {
        let b = UIButton()
        b.backgroundColor = .white
        b.setTitle("To'lov qilish", for: .normal)
        b.setTitleColor(.appColor(color: .mainBlue), for: .normal)
        b.titleLabel?.font = .appFont(ofSize: 14)
        b.addTarget(.none, action: #selector(buyBtnTapped), for: .touchUpInside)
        return b
    }()
    private lazy var btnBackV: UIView = {
       let v = UIView()
        v.backgroundColor = .white
        v.addSubview(buyBtn)
        v.layer.cornerRadius = 6
        buyBtn.snp.makeConstraints { make in
            make.top.equalTo(4)
            make.bottom.equalTo(-4)
            make.right.equalTo(-12)
            make.left.equalTo(12)
        }
        return v
    }()
   
    private lazy var stackV: UIStackView = {
        let s = UIStackView(arrangedSubviews: [titleLbl,btnBackV])
        s.spacing = 16
        s.alignment = .center
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
// lbl
    private lazy var lbl: UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 16,weight: .medium)
        l.textColor = .appColor(color: .black1)
        l.text = "How it works"
        return l
    }()
//    firstLbl
    private lazy var firstImg: UIImageView = {
       let i = UIImageView()
        i.image = UIImage(named: "imageLbl")
        i.snp.makeConstraints { make in
            make.width.height.equalTo(32)
        }
        return i
    }()
    private lazy var firstLbl: UILabel = {
       let l = UILabel()
        l.text = "You will get 1 coin for signing up"
        l.textColor = .appColor(color: .black3)
        l.font = .appFont(ofSize: 14)
        
        return l
    }()
    private lazy var firstSV: UIStackView = {
       let s = UIStackView(arrangedSubviews: [firstImg,firstLbl])
        s.axis = .horizontal
        s.distribution = .fill
        s.alignment = .fill
        s.spacing = 8
        return s
    }()
    private lazy var firstV: UIView = {
       let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(firstSV)
        firstSV.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        return v
    }()
    
    //    secondLbl
        private lazy var secondImg: UIImageView = {
           let i = UIImageView()
            i.image = UIImage(named: "imageLbl")
            i.snp.makeConstraints { make in
                make.width.height.equalTo(32)
            }
            return i
        }()
        private lazy var secondLbl: UILabel = {
           let l = UILabel()
            l.text = "You earn 1 coin for every buying course"
            l.textColor = .appColor(color: .black3)
            l.font = .appFont(ofSize: 14)
            
            return l
        }()
        private lazy var secondSV: UIStackView = {
           let s = UIStackView(arrangedSubviews: [secondImg,secondLbl])
            s.axis = .horizontal
            s.distribution = .fill
            s.alignment = .fill
            s.spacing = 8
            return s
        }()
        private lazy var secondV: UIView = {
           let v = UIView()
            v.backgroundColor = .clear
            v.addSubview(secondSV)
            secondSV.snp.makeConstraints { make in
                make.top.left.right.bottom.equalTo(0)
            }
            return v
        }()
    
    //    thirdLbl
        private lazy var thirdImg: UIImageView = {
           let i = UIImageView()
            i.image = UIImage(named: "imageLbl")
            i.snp.makeConstraints { make in
                make.width.height.equalTo(32)
            }
            return i
        }()
        private lazy var thirdLbl: UILabel = {
           let l = UILabel()
            l.text = "You will get 1 coin for every invited friend"
            l.textColor = .appColor(color: .black3)
            l.font = .appFont(ofSize: 14)
            
            return l
        }()
        private lazy var thirdSV: UIStackView = {
           let s = UIStackView(arrangedSubviews: [thirdImg,thirdLbl])
            s.axis = .horizontal
            s.distribution = .fill
            s.alignment = .fill
            s.spacing = 8
            return s
        }()
        private lazy var thirdV: UIView = {
           let v = UIView()
            v.backgroundColor = .clear
            v.addSubview(thirdSV)
            thirdSV.snp.makeConstraints { make in
                make.top.left.right.bottom.equalTo(0)
            }
            return v
        }()
//    lblStack
    private lazy var lblStackV: UIStackView = {
       let s = UIStackView(arrangedSubviews: [lbl,firstV,secondV,thirdV])
        s.spacing = 16
        s.alignment = .fill
        s.distribution = .fillEqually
        s.axis = .vertical
        return s
    }()
//    LastStackV
    private lazy var lastStack: UIStackView = {
       let s = UIStackView(arrangedSubviews: [backV,lblStackV])
        s.axis = .vertical
        s.distribution = .fill
        s.alignment = .fill
        s.spacing = 40
        return s
    }()
//    ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
//    SetUpUi
    func setUpUI() {
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        backV.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        backV.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(24)
            make.left.right.equalToSuperview().inset(24)
        }
        view.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(24)
            make.right.left.equalToSuperview().inset(16)
            
        }
        setNavController()
    }
    
//    setNavController
    func setNavController() {
        navigationController?.navigationBar.update(backgroundColor: .white,font: .appFont(ofSize: 16,weight: .medium))
        let leftBtn = UIBarButtonItem(title: "Balance", style: .done, target: self, action: .none)
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.2039215686, alpha: 1)
        
    }
    
    
    @objc func buyBtnTapped() {
        let vc = PaymentsVC()
       vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    

}
