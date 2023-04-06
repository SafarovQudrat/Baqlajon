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
            make.height.equalTo(157)
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
                make.width.height.equalTo(30)
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
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
    private lazy var lblBackV:UIView = {
       let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 8
        v.addSubview(lblStackV)
        lblStackV.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview().inset(16)
        }
        return v
    }()
//    CoinsV
    private lazy var coinBackImageV:UIImageView = {
       let i = UIImageView()
        i.image = UIImage(named: "coinsbackImage")
        return i
    }()
//    coinimg
    private lazy var coinImg: UIImageView = {
       let v = UIImageView()
        v.backgroundColor = .clear
        v.image = UIImage(named: "coin")
        return v
    }()
    lazy var coinLbl: UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 18,weight: .medium)
        l.textColor = .white
        l.text = "120 coins"
        return l
    }()
    private lazy var coinStack:UIStackView = {
       let s = UIStackView(arrangedSubviews: [coinImg,coinLbl])
        s.spacing = 16
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
    private lazy var coinV:UIView = {
       let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(coinStack)
        coinStack.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(0)
        }
        return v
    }()
//    rLbl
    private lazy var rV: UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9998322129, green: 0.6800814271, blue: 0.1177380309, alpha: 1)
        v.snp.makeConstraints { make in
            make.width.height.equalTo(4)
        }
        v.layer.cornerRadius = 2
        return v
    }()
    private lazy var rV2:UIView = {
       let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(rV)
        rV.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(v.center)
        }
        return v
    }()
    private lazy var rLbl: UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 13)
        l.textColor = .white
        l.text = "30 coins for registration"
        l.numberOfLines = 0
        return l
    }()
    private lazy var rStack: UIStackView = {
       let s = UIStackView(arrangedSubviews: [rV2,rLbl])
        s.axis = .horizontal
        s.distribution = .fill
        s.alignment = .center
        s.spacing = 4
        return s
    }()
    //    cLbl
        private lazy var cV: UIView = {
           let v = UIView()
            v.backgroundColor = #colorLiteral(red: 0.9998322129, green: 0.6800814271, blue: 0.1177380309, alpha: 1)
            v.snp.makeConstraints { make in
                make.width.height.equalTo(4)
            }
            v.layer.cornerRadius = 2
            return v
        }()
    private lazy var cV2:UIView = {
       let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(cV)
        cV.snp.makeConstraints { make in
            make.center.equalTo(v.center)
        }
        return v
    }()
        private lazy var cLbl: UILabel = {
           let l = UILabel()
            l.font = .appFont(ofSize: 13)
            l.textColor = .white
            l.text = "60 coins for buying courses"
            l.numberOfLines = 0
            return l
        }()
        private lazy var cStack: UIStackView = {
           let s = UIStackView(arrangedSubviews: [cV2,cLbl])
            s.axis = .horizontal
            s.distribution = .fill
            s.alignment = .center
            s.spacing = 4
            return s
        }()
    //    fLbl
        private lazy var fV: UIView = {
           let v = UIView()
            v.backgroundColor = #colorLiteral(red: 0.9998322129, green: 0.6800814271, blue: 0.1177380309, alpha: 1)
            v.snp.makeConstraints { make in
                make.width.height.equalTo(4)
            }
            v.layer.cornerRadius = 2
            return v
        }()
    private lazy var fV2:UIView = {
       let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(fV)
        fV.snp.makeConstraints { make in
            make.center.equalTo(v.center)
        }
        return v
    }()
        private lazy var fLbl: UILabel = {
           let l = UILabel()
            l.font = .appFont(ofSize: 13)
            l.textColor = .white
            l.text = "30 coins for invite friends"
            l.numberOfLines = 0
            return l
        }()
        private lazy var fStack: UIStackView = {
           let s = UIStackView(arrangedSubviews: [fV,fLbl])
            s.axis = .horizontal
            s.distribution = .fill
            s.alignment = .center
            s.spacing = 4
            return s
        }()
    //    btnThings
        private lazy var buyTBtn: UIButton = {
            let b = UIButton()
            b.backgroundColor = .white
            b.setTitle("To'lov qilish", for: .normal)
            b.setTitleColor(.appColor(color: .mainBlue), for: .normal)
            b.titleLabel?.font = .appFont(ofSize: 14)
            b.addTarget(.none, action: #selector(buyBtnTapped), for: .touchUpInside)
            return b
        }()
        private lazy var btnTBackV: UIView = {
           let v = UIView()
            v.backgroundColor = .white
            v.addSubview(buyTBtn)
            v.layer.cornerRadius = 6
            v.snp.makeConstraints { make in
                make.height.equalTo(30)
            }
            buyTBtn.snp.makeConstraints { make in
                make.top.equalTo(4)
                make.bottom.equalTo(-4)
                make.right.equalTo(-12)
                make.left.equalTo(12)
            }
            return v
        }()
//  Stack Views
    private lazy var cLblStack:UIStackView = {
       let s = UIStackView(arrangedSubviews: [rStack,cStack,fStack,btnTBackV])
        s.spacing = 10
        s.alignment = .leading
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
    private lazy var lastCoinStack:UIStackView = {
       let s = UIStackView(arrangedSubviews: [coinV,cLblStack])
        s.axis = .horizontal
        s.distribution = .fill
        s.alignment = .fill
        s.spacing  = 37
        return s
    }()
    private lazy var coinBackV: UIView = {
       let v = UIView()
        v.backgroundColor = .clear
       
        v.snp.makeConstraints { make in
            make.height.equalTo(157)
        }
       

        return v
    }()
//    ShareStackV
    private lazy var shareTLbl: UILabel = {
        let l = UILabel()
        l.textColor = #colorLiteral(red: 0, green: 0.6406018734, blue: 0.9510455728, alpha: 1)
        l.font = .appFont(ofSize: 16,weight: .medium)
        l.text = "Share and get coins"
        l.textAlignment = .center
        return l
    }()
    private lazy var shareLbl: UILabel = {
       let l = UILabel()
        l.textAlignment = .center
        l.text = "Share your referral link and earn 5 coins"
        l.font = .appFont(ofSize: 14)
        l.textColor = .appColor(color: .black3)
        return l
    }()
    private lazy var shareStack: UIStackView = {
       let s = UIStackView(arrangedSubviews: [shareTLbl,shareLbl])
        s.spacing = 8
        s.alignment = .center
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
//    shareCodeLblV
    private lazy var docImgBtn: UIButton = {
       let i = UIButton()
        i.setImage(UIImage(named: "docImg"), for: .normal)
        i.tintColor = .appColor(color: .gray3)
        return i
    }()
    private lazy var codeLbl: UILabel = {
       let l = UILabel()
        l.textColor = .appColor(color: .black3)
        l.font = .appFont(ofSize: 14)
        l.text = "fhdjfkfkfkfllflfl".uppercased()
        return l
    }()
    private lazy var shareBtn:UIButton = {
       let b = UIButton()
        b.setTitle("Share", for: .normal)
        b.titleLabel?.font = .appFont(ofSize: 14,weight: .medium)
        b.setTitleColor(.systemBlue, for: .normal)
        b.addTarget(.none, action: #selector(shareBtnTapped), for: .touchUpInside)
        return b
    }()
    private lazy var shareCStack: UIStackView = {
       let s = UIStackView(arrangedSubviews: [docImgBtn,codeLbl,shareBtn])
        s.axis = .horizontal
        s.distribution = .equalCentering
        s.alignment = .fill
        s.spacing = 0
        return s
    }()
    private lazy var shareBackV:UIView = {
       let v = UIView()
        v.layer.borderColor = UIColor.systemGray5.cgColor
        v.layer.borderWidth = 1
        v.layer.cornerRadius = 8
        v.addSubview(shareCStack)
        shareCStack.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.bottom.equalTo(-8)
            make.left.equalTo(14)
            make.right.equalTo(-14)
        }
        return v
    }()
//    ShareBackV
    private lazy var shareLastSV: UIStackView = {
       let s = UIStackView(arrangedSubviews: [shareStack,shareBackV])
        s.spacing = 24
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
    private lazy var shareBView:UIView = {
       let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 8
        v.snp.makeConstraints { make in
            make.height.equalTo(140)
        }
       
        return v
    }()
//    LastStackV
    private lazy var lastStack: UIStackView = {
       let s = UIStackView(arrangedSubviews: [backV,coinBackV,shareBView,lblBackV])
        s.axis = .vertical
        s.distribution = .fill
        s.alignment = .fill
        s.spacing = 16
        return s
    }()
  
//    ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setNavController()
        backV.isHidden = true
        coinBackV.isHidden = false
        shareBView.isHidden = false
        getPromoCode()
    }
//    SetUpUi
    func setUpUI() {
        self.view.backgroundColor = .appColor(color: .background)
        coinBackV.addSubview(coinBackImageV)
        coinBackImageV.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        coinBackV.addSubview(lastCoinStack)
        lastCoinStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(24)
            make.left.right.equalToSuperview().inset(20)

        }
        shareBView.addSubview(shareLastSV)
        shareLastSV.snp.makeConstraints { make in
            make.top.left.equalTo(16)
            make.bottom.right.equalTo(-16)
        }
        view.addSubview(coinBackV)
        coinBackV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(24)
            make.right.left.equalToSuperview().inset(16)
        }
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
        
        
    }
//    setNavController
    func setNavController() {
        navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white),font: .appFont(ofSize: 16,weight: .medium))
        let leftBtn = UIBarButtonItem(title: "Balance", style: .done, target: self, action: .none)
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.rightBarButtonItem?.tintColor =  .appColor(color: .black3)
        navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
        
    }
    @objc func buyBtnTapped() {
        coinBackV.isHidden = false
        shareBView.isHidden = false
        if backV.isHidden {
            navigationController?.pushViewController(ShopVC(), animated: true)
        }
        backV.isHidden = true
    }
    @objc func shareBtnTapped() {
        self.navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .appColor(color: .black1)
        self.navigationController?.pushViewController(ShareReferalCodeVC(), animated: true)
    }
}
extension BalanceVC {
    func getPromoCode() {
        API.getPromoCode { [self] data in
            
            if data["success"].boolValue {
                codeLbl.text = data["data"]["code"].stringValue
                
                cache.set(data["data"]["code"].stringValue, forKey: "PROMO")
            }else {
                Alert.showAlert(title: data["message"].stringValue, message: data["message"].stringValue, vc: self)
            }
        }
    }
}
