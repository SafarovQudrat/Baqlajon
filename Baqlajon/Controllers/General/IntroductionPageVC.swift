//
//  IntroductionPageViewController.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 08/02/23.
//

import UIKit
import SnapKit

class IntroductionPageVC: UIViewController {
    
    private var sizeForItem: CGSize { CGSize(width: view.frame.width, height: 300) }
    private let dataModel = [
        Introduction(imageName: "introductionImage1", titleText: "Find your favorite course", introText: "Our new videos make it easy for you to learn anywhere, there are new videos that will be ready to help you"),
        Introduction(imageName: "introductionImage2", titleText: "Learn with fun", introText: "Our new videos make it easy for you to learn anywhere, there are new videos that will be ready to help you"),
        Introduction(imageName: "introductionImage3", titleText: "Get good results", introText: "Our new videos make it easy for you to learn anywhere, there are new videos that will be ready to help you")
    ]
    
    private var currentIndex = 0
    private let shapeLayer = CAShapeLayer()
    var center: CGPoint { CGPoint(x: (view.frame.size.width / 2), y: (view.frame.size.height - 92.5)) }
    private lazy var circularPathForProgress = UIBezierPath(arcCenter: center, radius: 43, startAngle: 0, endAngle: .pi, clockwise: true)
    

    private lazy var progressViewButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "progress"), for: .normal)
        button.addTarget(self, action: #selector(progressDidTap), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = sizeForItem
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(IntroductionCVC.self, forCellWithReuseIdentifier: IntroductionCVC.identifier)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        print(view.frame.size.height)
        view.backgroundColor = .systemBackground
        configureConstraints()
    }
    
    
    
    // MARK: - methods
    
    @objc private func progressDidTap() {
        let nextIndex = min(currentIndex + 1, dataModel.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        currentIndex = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        
        // progressView Bar indicator animation
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 0.25
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "strokeEnd")
        
        switch currentIndex {
        case 0:
            print("j")
        case 1:
            print("a")
        case 2:
            print("b")
        default:
            break
        }
        shapeLayer.strokeEnd = CGFloat.pi / 6
        
    }
    
    
    
    // MARK: - layout
    
    private func configureConstraints() {
        view.addSubview(collectionView)
        view.addSubview(progressViewButton)
        
        collectionView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(500)
        }
        
        progressViewButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(65)
            make.width.equalTo(65)
        }
        
        configureProgressBar()
    }
    
    
    @objc private func configureProgressBar() {
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: 43, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.appColor(color: Colors.ellipseBackground).cgColor
        trackLayer.lineWidth = 2
        trackLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.appColor(color: Colors.ellipseBlue).cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.strokeEnd = CGFloat.pi / 9
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
    }

}


// MARK: - CollectionView extentsion

extension IntroductionPageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroductionCVC.identifier, for: indexPath) as? IntroductionCVC else { return UICollectionViewCell() }
        
        let model = dataModel[indexPath.item]
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        currentIndex = Int(x / view.frame.width)
    }
}
