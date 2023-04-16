//
//  CongratulationVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 20/02/23.
//

import UIKit
import SnapKit
class CongratulationVC: UIViewController {
//backImage
    private lazy var backImageV: UIImageView = {
       let i = UIImageView()
        i.image = UIImage(named: "congratulations")
        
        return i
    }()
    private lazy var titleLbl:UILabel = {
        let l = UILabel()
        l.font = .appFont(ofSize: 24,weight: .semiBold)
        l.textColor = .white
        l.text = "Congratulations!"
        l.textAlignment = .center
        return l
    }()
    private lazy var textLbl: UILabel = {
       let l = UILabel()
        l.textAlignment = .center
        l.textColor = .white
        l.font = .appFont(ofSize: 16)
        l.text = "New coins"
        return l
    }()
    private lazy var titleStackV: UIStackView = {
       let s = UIStackView(arrangedSubviews: [titleLbl,textLbl])
        s.spacing = 4
        s.alignment = .center
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
//    coinView
    private lazy var coinImg:UIImageView = {
       let i = UIImageView()
        i.image = UIImage(named: "coin")
        i.snp.makeConstraints { make in
            make.width.height.equalTo(140)
        }
        return i
    }()
    private lazy var cLbl: UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 16,weight: .medium)
        l.textColor = .appColor(color: .black1)
        l.text = "You have just earned "
        l.textAlignment = .center
        return l
    }()
    private lazy var coinLbl: UILabel = {
       let l = UILabel()
        l.textAlignment = .center
        l.text = "+ 3 coins"
        l.textColor = .appColor(color: .green)
        l.font = .appFont(ofSize: 20,weight: .semiBold)
        return l
    }()
    private lazy var claimBtn: BNButton = {
       let b = BNButton()
        b.setTitle("Claim reward", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = .appColor(color: .mainBlue)
        b.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        b.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return b
    }()
    private lazy var cLblStack: UIStackView = {
       let s = UIStackView(arrangedSubviews: [cLbl,coinLbl])
        s.axis = .vertical
        s.distribution = .fill
        s.alignment = .center
        s.spacing = 16
        return s
    }()
    private lazy var coinImageStack: UIStackView = {
       let s = UIStackView(arrangedSubviews: [coinImg,cLblStack])
        s.spacing = 30
        s.alignment = .center
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
    private lazy var claimBtnStackV:UIStackView = {
       let s = UIStackView(arrangedSubviews: [coinImageStack,claimBtn])
        s.axis = .vertical
        s.distribution = .fill
        s.alignment = .fill
        s.spacing = 30
        return s
    }()
    private lazy var starsImg: UIImageView = {
       let i = UIImageView()
        i.image = UIImage(named: "imagewithstar")
        i.contentMode = .scaleAspectFill
        return i
    }()
    private lazy var coinV: UIView = {
       let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 8
        v.snp.makeConstraints { make in
            make.height.equalTo(407)
            make.width.equalTo(311)
        }
        v.addSubview(starsImg)
        starsImg.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        v.addSubview(claimBtnStackV)
        claimBtnStackV.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.bottom.equalTo(-40)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        return v
    }()
    
//  lastStack
    private lazy var lastStack: UIStackView = {
       let s = UIStackView(arrangedSubviews: [titleStackV,coinV])
        s.axis = .vertical
        s.distribution = .fill
        s.alignment = .center
        s.spacing = 24
        return s
    }()
    
    
    
    
    
    
//   ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.overrideUserInterfaceStyle = .light
        view.addSubview(backImageV)
        backImageV.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        view.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }
        setLang()
        observeLangNotif()
    }
    
    @objc func btnTapped() {
        self.dismiss(animated: true)
    }
  
    
    func setLang() {
        titleLbl.text = Lang.getString(type: .congTitle)
        textLbl.text = Lang.getString(type: .congText)
        cLbl.text = Lang.getString(type: .CongCText)
    }

}
//MARK: - NnotificationCenter for language changing
extension CongratulationVC {
    func observeLangNotif() {
        NotificationCenter.default.addObserver(self, selector: #selector(changLang), name: NSNotification.Name.init(rawValue: "LANGNOTIFICATION"), object: nil)
        print("NotificationCenter StartVC")
    }
    @objc func changLang(_ notification: NSNotification) {
        guard let lang = notification.object as? Int else { return }
        switch lang {
        case 0:
            Cache.save(appLanguage: .uz)
            setLang()
        case 1:
            Cache.save(appLanguage: .ru)
            setLang()
        case 2:
            Cache.save(appLanguage: .en)
            setLang()
        default: break
        }
    }
}
