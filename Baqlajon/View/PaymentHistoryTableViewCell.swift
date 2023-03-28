//
//  PaymentHistoryTableViewCell.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 19/02/23.
//

import UIKit

class PaymentHistoryTableViewCell: UITableViewCell {
    
    static let identifier = "PaymentHistoryTableViewCell"
    
    
    private let backgroundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.appColor(color: Colors.white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let clickPaymeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "clickInPaymentHistory")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gulsevar Usmonova"
        label.textColor = UIColor.appColor(color: Colors.black1)
        label.font = UIFont.appFont(ofSize: 14, weight: FontWeight.medium)
        return label
    }()
    
    
    private let cartNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "860092******8281"
        label.textColor = UIColor.appColor(color: Colors.gray2)
        label.font = UIFont.appFont(ofSize: 12, weight: FontWeight.medium)
        return label
    }()
    
    
    private lazy var usernameAndCartNumberStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameLabel, cartNumberLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let billLabel: UILabel = {
        let label = UILabel()
        label.text = "+99.000 UZS"
        label.textColor = UIColor.appColor(color: Colors.green)
        label.font = UIFont.appFont(ofSize: 14, weight: FontWeight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let paymentDataLabel: UILabel = {
        let label = UILabel()
        label.text = "10.01.2022 12:30"
        label.textColor = UIColor.appColor(color: Colors.gray1)
        label.font = UIFont.appFont(ofSize: 10, weight: FontWeight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.appColor(color: Colors.background)
        
        configureConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    

    private func configureConstraints() {
        
        contentView.addSubview(backgroundedView)
        NSLayoutConstraint.activate([
            backgroundedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        backgroundedView.addSubview(clickPaymeImageView)
        NSLayoutConstraint.activate([
            clickPaymeImageView.topAnchor.constraint(equalTo: backgroundedView.topAnchor, constant: 12),
            clickPaymeImageView.leadingAnchor.constraint(equalTo: backgroundedView.leadingAnchor, constant: 12),
            clickPaymeImageView.heightAnchor.constraint(equalToConstant: 53),
            clickPaymeImageView.widthAnchor.constraint(equalToConstant: 58)
        ])
        
        backgroundedView.addSubview(usernameAndCartNumberStackView)
        NSLayoutConstraint.activate([
            usernameAndCartNumberStackView.centerYAnchor.constraint(equalTo: clickPaymeImageView.centerYAnchor),
            usernameAndCartNumberStackView.leadingAnchor.constraint(equalTo: clickPaymeImageView.trailingAnchor, constant: 8)
        ])
        
        backgroundedView.addSubview(billLabel)
        NSLayoutConstraint.activate([
            billLabel.centerYAnchor.constraint(equalTo: clickPaymeImageView.centerYAnchor),
            billLabel.trailingAnchor.constraint(equalTo: backgroundedView.trailingAnchor, constant: -12)
        ])
        
        backgroundedView.addSubview(paymentDataLabel)
        NSLayoutConstraint.activate([
            paymentDataLabel.trailingAnchor.constraint(equalTo: backgroundedView.trailingAnchor, constant: -12),
            paymentDataLabel.bottomAnchor.constraint(equalTo: backgroundedView.bottomAnchor, constant: -12)
        ])
    }
}
