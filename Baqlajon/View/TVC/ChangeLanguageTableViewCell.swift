//
//  ChangeLanguageTableViewCell.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 18/02/23.
//

import UIKit

class ChangeLanguageTableViewCell: UITableViewCell {

    static let identifier = "ChangeLanguageTableViewCell"
    
    
    private let backgroundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.appColor(color: Colors.gray6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "uzbekChangeLanguage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "O’zbekcha"
        label.textColor = UIColor.appColor(color: Colors.black1)
        label.font = UIFont.appFont(ofSize: 16, weight: FontWeight.regular)
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
        
        backgroundedView.addSubview(countryImageView)
        NSLayoutConstraint.activate([
            countryImageView.centerYAnchor.constraint(equalTo: backgroundedView.centerYAnchor),
            countryImageView.leadingAnchor.constraint(equalTo: backgroundedView.leadingAnchor, constant: 16),
            countryImageView.heightAnchor.constraint(equalToConstant: 24),
            countryImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        backgroundedView.addSubview(languageLabel)
        NSLayoutConstraint.activate([
            languageLabel.centerYAnchor.constraint(equalTo: countryImageView.centerYAnchor),
            languageLabel.leadingAnchor.constraint(equalTo: countryImageView.trailingAnchor, constant: 16)
        ])
        
    }
    
}
