//
//  ShareReferalCodeVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 20/02/23.
//

import UIKit
import EventKit
import CoreImage
class ShareReferalCodeVC: UIViewController {

    private lazy var qrImage:UIImageView = {
        let i = UIImageView()
        i.snp.makeConstraints { make in
            make.width.height.equalTo(236)
        }
        return i
    }()
    
     lazy var lbl:UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 18)
        l.textColor = .appColor(color: .mainBlue)
        l.textAlignment = .center
        l.text = "fhdjfkfkfkfllflfl".uppercased()
        return l
    }()
    
    private lazy var stackV: UIStackView = {
       let s = UIStackView(arrangedSubviews: [qrImage,lbl])
        s.spacing = 24
        s.alignment = .center
        s.distribution = .fill
        s.axis = .vertical
        return s
    }()
    private lazy var backV: UIView = {
       let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview().inset(32)
        }
        return v
    }()
    
    private lazy var btn: BNButton = {
       let b = BNButton()
        b.setTitle("Share referral code", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = .appColor(color: .mainBlue)
        b.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        b.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .appColor(color: .background)
        setNavigationController()
        lbl.text = cache.string(forKey: "PROMO")
        guard let qrURLImage = URL(string: lbl.text!.uppercased())?.qrImage(using: #colorLiteral(red: 0.1450980392, green: 0.6078431373, blue: 0.9450980392, alpha: 1)) else { return }
            
            qrImage.image = qrURLImage
        self.view.addSubview(backV)
        backV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(24)
            make.centerX.equalTo(view.center)
        }
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(70)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    func generateQRCode(from string: String) -> UIImage? {
                        let data = string.data(using: .ascii, allowLossyConversion: false)
                        let filter = CIFilter(name: "CIQRCodeGenerator")
                        filter?.setValue(data, forKey: "inputMessage")
                        let img = UIImage(cgImage: CIContext(options: nil).createCGImage((filter?.outputImage!)!, from: (filter?.outputImage!.extent)!)!)
                        return img
                    }
    
    func setNavigationController() {
        title = "Share referral code"
        self.navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white),titleColor: .appColor(color: .black1),font: .appFont(ofSize: 16,weight: .medium))
        let leftBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(backBtnTapped))
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func btnTapped() {
        let vc = CongratulationVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}
