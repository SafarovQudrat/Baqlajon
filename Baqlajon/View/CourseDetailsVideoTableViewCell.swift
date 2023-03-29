//
//  CourseDetailsTVC.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 10/02/23.
//

import UIKit

class CourseDetailsVideoTableViewCell: UITableViewCell {
    
    static let identifier = "CourseDetailsVideoTableViewCell"
    
    
    private let backgroundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let lessonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "courseDetailsTableViewCellImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let lessonTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Set up 3D Max account"
        label.font = UIFont.appFont(ofSize: 16, weight: FontWeight.semiBold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let eyeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "eyeImageCourseDetails")
        imageView.tintColor = UIColor.appColor(color: Colors.gray1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let numberOfWatchedLessonLabel: UILabel = {
        let label = UILabel()
        label.text = " 6k   "
        label.font = UIFont.appFont(ofSize: 12, weight: FontWeight.medium)
        label.textColor = UIColor.appColor(color: Colors.gray1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let clockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "clockImageCourseDetails")
        imageView.tintColor = UIColor.appColor(color: Colors.gray1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let timeOfLessonLabel: UILabel = {
        let label = UILabel()
        label.text = " 15 mins"
        label.font = UIFont.appFont(ofSize: 12, weight: FontWeight.medium)
        label.textColor = UIColor.appColor(color: Colors.gray1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var lessonWatchedNumbersAndLessonMinutesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [eyeImageView, numberOfWatchedLessonLabel, clockImageView, timeOfLessonLabel])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private lazy var lessonTitleAndInfoOfNumberOfViewsAndLessonMinutesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lessonTitleLabel, lessonWatchedNumbersAndLessonMinutesStackView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let backgroundLockView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(color: Colors.background)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let lockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lockImageCourseDetails")
        imageView.tintColor = UIColor.appColor(color: Colors.gray1)
        imageView.backgroundColor = UIColor.appColor(color: Colors.background)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        
        backgroundedView.addSubview(lessonImageView)
        NSLayoutConstraint.activate([
            lessonImageView.centerYAnchor.constraint(equalTo: backgroundedView.centerYAnchor),
            lessonImageView.leadingAnchor.constraint(equalTo: backgroundedView.leadingAnchor, constant: 14),
            lessonImageView.heightAnchor.constraint(equalToConstant: 48),
            lessonImageView.widthAnchor.constraint(equalToConstant: 48)
        ])
        
        backgroundedView.addSubview(lessonTitleAndInfoOfNumberOfViewsAndLessonMinutesStackView)
        NSLayoutConstraint.activate([
            lessonTitleAndInfoOfNumberOfViewsAndLessonMinutesStackView.centerYAnchor.constraint(equalTo: lessonImageView.centerYAnchor),
            lessonTitleAndInfoOfNumberOfViewsAndLessonMinutesStackView.leadingAnchor.constraint(equalTo: lessonImageView.trailingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            clockImageView.heightAnchor.constraint(equalToConstant: 14),
            clockImageView.widthAnchor.constraint(equalToConstant: 14)
        ])

        NSLayoutConstraint.activate([
            eyeImageView.heightAnchor.constraint(equalToConstant: 14),
            eyeImageView.widthAnchor.constraint(equalToConstant: 14)
        ])
        
        backgroundedView.addSubview(backgroundLockView)
        NSLayoutConstraint.activate([
            backgroundLockView.centerYAnchor.constraint(equalTo: backgroundedView.centerYAnchor),
            backgroundLockView.trailingAnchor.constraint(equalTo: backgroundedView.trailingAnchor, constant: -14),
            backgroundLockView.heightAnchor.constraint(equalToConstant: 40),
            backgroundLockView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        backgroundLockView.addSubview(lockImageView)
        NSLayoutConstraint.activate([
            lockImageView.centerYAnchor.constraint(equalTo: backgroundLockView.centerYAnchor),
            lockImageView.centerXAnchor.constraint(equalTo: backgroundLockView.centerXAnchor),
            lockImageView.heightAnchor.constraint(equalToConstant: 24),
            lockImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    

}
