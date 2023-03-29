//
//  CourseDetailsReviewsTableViewCell.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 15/02/23.
//

import UIKit

class CourseDetailsReviewsTableViewCell: UITableViewCell {
    
    static let identifier = "CourseDetailsReviewsTableViewCell"
    
    
    private let backgroundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .appColor(color: .background)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "courseDetailsTableViewCellImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.text = "Asila Alijonova"
        label.font = UIFont.appFont(ofSize: 16, weight: FontWeight.medium)
        label.textColor = UIColor.appColor(color: Colors.black1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let ratingView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appColor(color: Colors.ellipseBlue).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "courseDetailsStarImageView")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = " 5"
        label.textColor = UIColor.appColor(color: Colors.ellipseBlue)
        label.font = UIFont.appFont(ofSize: 12, weight: FontWeight.medium)
        return label
    }()
    
    
    private lazy var starImageAndRatingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starImageView, ratingLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This course is very useful. Excepteur sint occaecat cupidatat non proident, sun akjflakfjkajfdlajfkljlkdasjflkajflkajdsklfjkkljlkj kljlsdkvkljdklvjklsdjvklj lkjkldvj jkdjfk jkjkj fjalfjdfsj"
        label.textColor = UIColor.appColor(color: Colors.black2)
        label.font = UIFont.appFont(ofSize: 12, weight: FontWeight.regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let dataOfPublishReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "2 weeks ago"
        label.textColor = UIColor.appColor(color: Colors.gray1)
        label.font = UIFont.appFont(ofSize: 10, weight: FontWeight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.appColor(color: Colors.background)
        
        configureConstraints()
    }
    
    
    private func configureConstraints() {
        
        addSubview(backgroundedView)
        NSLayoutConstraint.activate([
            backgroundedView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            backgroundedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backgroundedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            backgroundedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        backgroundedView.addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: backgroundedView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: backgroundedView.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),
            avatarImageView.widthAnchor.constraint(equalToConstant: 32)
        ])
        
        backgroundedView.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8)
        ])
        
        backgroundedView.addSubview(ratingView)
        NSLayoutConstraint.activate([
            ratingView.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            ratingView.trailingAnchor.constraint(equalTo: backgroundedView.trailingAnchor, constant: -16),
            ratingView.heightAnchor.constraint(equalToConstant: 26),
            ratingView.widthAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            starImageView.heightAnchor.constraint(equalToConstant: 14),
            starImageView.widthAnchor.constraint(equalToConstant: 14)
        ])
        
        ratingView.addSubview(starImageAndRatingStackView)
        NSLayoutConstraint.activate([
            starImageAndRatingStackView.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
            starImageAndRatingStackView.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor)
        ])
        
        backgroundedView.addSubview(dataOfPublishReviewLabel)
        NSLayoutConstraint.activate([
            dataOfPublishReviewLabel.leadingAnchor.constraint(equalTo: backgroundedView.leadingAnchor, constant: 16),
            dataOfPublishReviewLabel.bottomAnchor.constraint(equalTo: backgroundedView.bottomAnchor, constant: -16)
        ])
        
        backgroundedView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundedView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: backgroundedView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: dataOfPublishReviewLabel.topAnchor, constant: -8)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
