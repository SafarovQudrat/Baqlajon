//
//  ShopTVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 03/04/23.
//

import UIKit

class ShopTVC: UITableViewCell {
    
    private lazy var image:UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        i.image = UIImage(named: "Iphone")
        return i
    }()
    private lazy var titleLbl:UILabel = {
        let l = UILabel()
        l.font = .appFont(ofSize: 16)
        l.textColor = .appColor(color: .black1)
        l.text = "Iphone 14 Pro"
        return l
    }()
    private lazy var priceLbl:UILabel = {
        let l = UILabel()
        l.textColor = .appColor(color: .mainBlue)
        l.font = .appFont(ofSize: 16)
        l.text = "1000 coins"
        return l
    }()
    private lazy var buyBtn:UIButton = {
        let b = UIButton()
        b.setTitle("Buy", for: .normal)
        b.backgroundColor = .appColor(color: .mainBlue)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 8
        b.snp.makeConstraints { make in
            make.height.equalTo(28)
            make.width.equalTo(50)
        }
        b.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
        return b
    }()
    private lazy var backV:UIView = {
        let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 8
        return v
    }()
    private lazy var stackV:UIStackView = {
        let s = UIStackView(arrangedSubviews: [priceLbl,buyBtn])
        s.alignment = .fill
        s.axis = .horizontal
        s.distribution = .fill
        s.spacing = 10
        return s
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(backV)
        backV.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(6)
        }
        backV.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(8)
            make.height.equalTo(80)
            make.width.equalTo(90)
        }
        backV.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.left.equalTo(image.snp_rightMargin).inset(-16)
        }
        backV.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.bottom.equalTo(-16)
            make.left.equalTo(image.snp_rightMargin).inset(-16)
            make.right.equalTo(-16)
        }
        contentView.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateCell(gift:GetGiftDM){
//        image.sd_setImage(with: URL(string: gift.image))
        let data = try? Data(contentsOf:  URL(string: gift.image)!)

        if let imageData = data {
            self.image.image = UIImage(data: imageData)
        }
        titleLbl.text = gift.name
        priceLbl.text = "\(gift.coin)"
    }
    @objc func btnTapped() {
        ShopAlert.showAlert(image: nil, title: "Congratulations!", text: "Your request has been received and we will contact you soon!")
    }

}
