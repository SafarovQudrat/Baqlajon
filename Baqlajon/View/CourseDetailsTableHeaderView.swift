//
//  CourseDetailsUIV.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 11/02/23.
//

import UIKit

class CourseDetailsTableHeaderView: UIView {
    
    private var screenSize: CGRect { UIScreen.main.bounds }
    
    private let courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "courseImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "3D Design Illustration"
        label.font = UIFont.appFont(ofSize: 20, weight: FontWeight.medium)
        label.textColor = UIColor.appColor(color: Colors.black1)
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This course will help others. Excepteur sint occaecat cupidatat non More..."
        label.font = UIFont.appFont(ofSize: 16, weight: FontWeight.regular)
        label.textColor = UIColor.appColor(color: Colors.gray1)
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatarImage")
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let username: UILabel = {
        let label = UILabel()
        label.text = "Alimardon Aliyev"
        label.font = UIFont.appFont(ofSize: 14, weight: FontWeight.medium)
        label.textColor = UIColor.appColor(color: Colors.black1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let profession: UILabel = {
        let label = UILabel()
        label.text = "SMM tutor"
        label.font = UIFont.appFont(ofSize: 12, weight: FontWeight.regular)
        label.textColor = UIColor.appColor(color: Colors.gray1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var verticalUsernameAndProfessionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [username, profession])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let videoPlayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.circle")
        imageView.tintColor = UIColor.appColor(color: Colors.green)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let numberOfVideosLabel: UILabel = {
        let label = UILabel()
        label.text = " 14 Videos"
        label.font = UIFont.appFont(ofSize: 14, weight: FontWeight.medium)
        label.textColor = UIColor.appColor(color: Colors.gray2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var videoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [videoPlayImageView, numberOfVideosLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let clockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "clock")
        imageView.tintColor = UIColor.appColor(color: Colors.red)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let numberOfCoursHours: UILabel = {
        let label = UILabel()
        label.text = " 7h 30min"
        label.font = UIFont.appFont(ofSize: 14, weight: FontWeight.medium)
        label.textColor = UIColor.appColor(color: Colors.gray2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var courseHoursStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [clockImageView, numberOfCoursHours])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let textBubbleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "text.bubble")
        imageView.tintColor = UIColor.appColor(color: Colors.yellow)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let numberOfReviews: UILabel = {
        let label = UILabel()
        label.text = " 565 Reviews"
        label.font = UIFont.appFont(ofSize: 14, weight: FontWeight.medium)
        label.textColor = UIColor.appColor(color: Colors.gray2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var reviewsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textBubbleImageView, numberOfReviews])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private lazy var courseMiniInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [videoStackView, courseHoursStackView, reviewsStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let graduationCapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "graduationcap")
        imageView.tintColor = UIColor.appColor(color: Colors.navyBlue)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let numberOfStdentLearnt: UILabel = {
        let label = UILabel()
        label.text = " 1000+ Student learnt"
        label.font = UIFont.appFont(ofSize: 14, weight: FontWeight.medium)
        label.textColor = UIColor.appColor(color: Colors.gray2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var secondCourseMiniInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [graduationCapImageView, numberOfStdentLearnt])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private lazy var videosButton: UIButton = {
        let button = BNButton(title: "Videos")
        button.configure()
        button.addTarget(self, action: #selector(videosButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var reviewsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reviews", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBackground
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appColor(color: Colors.gray2).cgColor
        button.setTitleColor(UIColor.appColor(color: Colors.gray2), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(reviewsButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [videosButton, reviewsButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        configureConstraints()
        
    }
    
    
    @objc private func videosButtonDidTap() {
        
    }
    
    
    @objc private func reviewsButtonDidTap() {
        
    }
    
    
    private func configureConstraints() {
        
        addSubview(courseImageView)
        NSLayoutConstraint.activate([
            courseImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            courseImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            courseImageView.widthAnchor.constraint(equalToConstant: screenSize.width - 32),
            courseImageView.heightAnchor.constraint(equalToConstant: (screenSize.width - 32) / 16 * 9)
        ])
        addSubview(courseImageView)
        NSLayoutConstraint.activate([
            courseImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            courseImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            courseImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            courseImageView.heightAnchor.constraint(equalToConstant: 198)
        ])
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: courseImageView.bottomAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 42),
            avatarImageView.widthAnchor.constraint(equalToConstant: 42)
        ])
        
        addSubview(verticalUsernameAndProfessionStackView)
        NSLayoutConstraint.activate([
            verticalUsernameAndProfessionStackView.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            verticalUsernameAndProfessionStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12)
        ])
        
        addSubview(courseMiniInfoStackView)
        NSLayoutConstraint.activate([
            courseMiniInfoStackView.topAnchor.constraint(equalTo: verticalUsernameAndProfessionStackView.bottomAnchor, constant: 27),
            courseMiniInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            courseMiniInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19)
        ])
        
        addSubview(secondCourseMiniInfoStackView)
        NSLayoutConstraint.activate([
            secondCourseMiniInfoStackView.topAnchor.constraint(equalTo: courseMiniInfoStackView.bottomAnchor, constant: 18),
            secondCourseMiniInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18)
        ])
        
        addSubview(buttonsStackView)
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: secondCourseMiniInfoStackView.bottomAnchor, constant: 25),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buttonsStackView.widthAnchor.constraint(equalToConstant: 230),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 34)
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
