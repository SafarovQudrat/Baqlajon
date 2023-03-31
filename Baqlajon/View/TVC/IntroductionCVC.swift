//
//  IntroductionCollectionViewCell.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 08/02/23.
//

import UIKit
import SnapKit

class IntroductionCVC: UICollectionViewCell {
    
    static let identifier = "IntroductionCVC"
  
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Our new videos make it easy for you to learn anywhere, there are new videos that will be ready to help you"
        label.font = UIFont.appFont(ofSize: 16, weight: FontWeight.regular)
        label.setLineSpacing(lineSpacing: 2)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Find your favorite course"
        label.font = UIFont.appFont(ofSize: 24, weight: FontWeight.medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "introductionImage1")
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        confiugreConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - layout
    
    private func confiugreConstraints() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(-50)
            make.centerX.equalTo(contentView)
            make.height.equalTo(250)
            make.width.equalTo(250)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imageView).inset(-60)
            make.centerX.equalTo(contentView)
            make.height.equalTo(36)
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-16)
            make.leading.equalTo(contentView).inset(27)
            make.trailing.equalTo(contentView).inset(27)
        }
    }
    
    
    // MARK: - configure DataModel
    
    public func configure(with model: Introduction) {
        imageView.image = UIImage(named: model.imageName)
        titleLabel.text = model.titleText
        textLabel.text = model.introText
    }
    
}
