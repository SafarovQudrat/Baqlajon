//
//  OnboardingVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 27/03/23.
//


//MARK: -BU Page hech qayerda ishlatilmagan Ishlatilmagan 












import UIKit
import SnapKit
class OnboardingVC: UIViewController {
    
    private lazy var image: UIImageView = {
        let i = UIImageView(image: UIImage(named: "OnBoard"))
        i.snp.makeConstraints { make in
            make.height.width.equalTo(250)
        }
        return i
    }()
    
    private lazy var loginBtn:BNButton = {
        let b = BNButton()
        b.backgroundColor = .appColor(color: .mainBlue)
        b.setTitle("Login", for: .normal)
        b.addTarget(.none, action: #selector(loginTapped), for: .touchUpInside)
        b.layer.cornerRadius = 8
        b.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return b
        
    }()
    private lazy var signUpBtn:BNButton = {
        let b = BNButton()
        b.backgroundColor = .appColor(color: .gray6)
        b.setTitle("Sign Up", for: .normal)
        b.setTitleColor(.appColor(color: .black1), for: .normal)
        b.layer.cornerRadius = 8
        b.addTarget(.none, action: #selector(signUpTapped), for: .touchUpInside)
        return b
    }()
    
    private lazy var stackV:UIStackView = {
        let s = UIStackView(arrangedSubviews: [loginBtn,signUpBtn])
        s.alignment = .fill
        s.distribution = .fillEqually
        s.axis = .vertical
        s.spacing = 16
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .appColor(color: .background)
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.centerX.equalTo(view.center.x)
            make.top.equalTo(180)
        }
        view.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(-50)
        }
        
        
        
    }
    
    @objc func loginTapped() {
        navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(LoginVC(), animated: true)
        
    }
    
    @objc func signUpTapped() {
        navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(SignUpVC(), animated: true)
        
    }
    
}
