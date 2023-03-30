//
//  ProfileVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 11/02/23.
//

import UIKit


class ProfileVC: UIViewController {
    
//    profile Image
    var profileImage:UIImageView = {
       let i = UIImageView(image: UIImage(named: "avatarImage"))
        i.snp.makeConstraints { make in
            make.width.height.equalTo(90)
        }
        i.layer.cornerRadius = 45
        return i
    }()
    
//    set Image
    private lazy var editButton:UIButton = {
       let b = UIButton()
        b.backgroundColor = #colorLiteral(red: 0, green: 0.6406018734, blue: 0.9510455728, alpha: 1)
        b.tintColor = .white
        b.setImage(UIImage(named: "pencil"), for: .normal)
        b.addTarget(.none, action: #selector(editTapped), for: .touchUpInside)
        b.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        b.layer.cornerRadius = 15
        return b
    }()
    private lazy var imgBackView:UIView = {
       let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(profileImage)
        v.addSubview(editButton)
        profileImage.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(0)
        }
        editButton.snp.makeConstraints { make in
            make.right.bottom.equalTo(0)
        }
        return v
    }()
    
//    Username
    var nameLbl:UILabel = {
    let l = UILabel()
    l.font = .appFont(ofSize: 18,weight: .medium)
    l.textColor = UIColor(named: "black 1")
        l.text = cache.string(forKey: "USER_NAME")
    return l
}()
    
//    userNumber
    var numberLbl:UILabel = {
    let l = UILabel()
    l.font = .appFont(ofSize: 16)
    l.textColor = UIColor(named: "gray 1")
        l.text = cache.string(forKey: "USER_PHONE_NUMBER")
    return l
}()
    private lazy var lblStackV:UIStackView = {
       let s = UIStackView(arrangedSubviews: [nameLbl,numberLbl])
        s.alignment = .center
        s.spacing = 0
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
    private lazy var stackV:UIStackView = {
       let s = UIStackView(arrangedSubviews: [imgBackView,lblStackV])
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 6
        s.alignment = .center
        return s
    }()
    private lazy var backBackV:UIView = {
       let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 12
        return v
    }()
    private let tBackV:UIView = {
       let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 12
        v.snp.makeConstraints { make in
            make.height.equalTo(160)
        }
        return v
    }()
    private let ttBackV:UIView = {
       let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 12
        v.snp.makeConstraints { make in
            make.height.equalTo(160)
        }
        return v
    }()
    
    
//    Payments history ,Language,DarkMode
    lazy var tableView:UITableView = {
       let t = UITableView()
        t.isScrollEnabled = false
        return t
    }()
    
    
//    About us,Share,Help
    lazy var ttableView:UITableView = {
       let t = UITableView()
        t.isScrollEnabled = false
        
        return t
    }()
    private lazy var lastStack:UIStackView = {
       let s = UIStackView(arrangedSubviews: [backBackV,tBackV,ttBackV])
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 16
        s.alignment = .fill
        return s
    }()
    
//    Payments history ,Language,DarkMode
    let arr1:[MyData] = [
        MyData(img: UIImage(named: "payment")!, title: "Payments history", isSwitchON: false),
        MyData(img: UIImage(named: "lang")!, title: "Language",text: "English", isSwitchON: false),
        MyData(img: UIImage(named: "darkM")!, title: "Dark mode", isSwitchON: true)
    
    ]
    
    
    //    About us,Share,Help
    let arr2:[MyData] = [
        MyData(img: UIImage(named: "alertCircle")!, title: "About us", isSwitchON: false),
        MyData(img: UIImage(named: "share")!, title: "Share", isSwitchON: false),
        MyData(img: UIImage(named: "help")!, title: "Help", isSwitchON: false)
    ]
    
    
//    ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor(color: .background)
        setUpUi()
    }
//    edit Tapped
    @objc func editTapped(){
        let vc = EditProfileVC()
        navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
//    SetUpUI - didload da yoziladigan funksiyalar
    func setUpUi() {
       
        backBackV.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview().inset(16)
           
        }

        tBackV.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview().inset(8)
        }
        
        ttBackV.addSubview(ttableView)
        ttableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview().inset(8)
        }
        
        self.view.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.left.right.equalToSuperview().inset(16)
            
        }
        
        ttableView.delegate = self
        ttableView.dataSource = self
        ttableView.separatorStyle = .none
        ttableView.register(ProfileTVC.self, forCellReuseIdentifier:"ProfileTVC" )
        setNavController()
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.register(ProfileTVC.self, forCellReuseIdentifier:"ProfileTVC" )
    }
    
    
    
//    setNavigation Controller
    func setNavController() {
        navigationController?.navigationBar.update(backgroundColor:.appColor(color: .white),titleColor: .appColor(color: .black1),font: .appFont(ofSize: 16,weight: .medium))
        let leftBtn = UIBarButtonItem(title: "Profile", style: .done, target: .none, action: .none )
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.rightBarButtonItem?.tintColor =  .appColor(color: .black3)
        navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
        navigationItem.backBarButtonItem?.tintColor  = .appColor(color: .black1)
    }

}
//MARK: - UITableViewDataSource,UITableViewDelegate

extension ProfileVC:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return 3
        }
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as? ProfileTVC else {return UITableViewCell()}
        if tableView == self.tableView  {
            cell.updateCell(data: arr1[indexPath.row])
        } else {
            cell.updateCell(data: arr2[indexPath.row])
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableView {
            if indexPath.row == 0 {
                navigationController?.pushViewController(PaymentHistoryViewController(), animated: true)
                navigationItem.backButtonTitle = ""
                navigationItem.backBarButtonItem?.tintColor = .appColor(color: .black1)
            } else if indexPath.row == 1 {
                navigationController?.pushViewController(ChangeLanguageViewController(), animated: true)
                navigationItem.backButtonTitle = ""
                navigationItem.backBarButtonItem?.tintColor = .appColor(color: .black1)
            }
        } else {
            if indexPath.row == 0 {
                navigationController?.pushViewController(AboutUsViewController(), animated: true)
                navigationItem.backButtonTitle = ""
                
            }
        }
    }
    
}
