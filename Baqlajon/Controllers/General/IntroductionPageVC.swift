//
//  IntroductionPageViewController.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 08/02/23.
//

import UIKit
import SnapKit
let cache = UserDefaults.standard
class IntroductionPageVC: UIViewController {
    
    private var sizeForItem: CGSize { CGSize(width: view.frame.width, height: 300) }
    
    
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
    var dataModel:[Introduction] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        print(view.frame.size.height)
        view.backgroundColor = .systemBackground
        configureConstraints()
        observeLangNotif()
        setLang()
    }
    
    // MARK: - methods
    
    @objc private func progressDidTap() {
        if currentIndex == dataModel.count - 1 {
            ChangeRootViewController.change(with: UINavigationController(rootViewController: OnboardingVC()))
            return
        }
        let nextIndex = min(currentIndex + 1, dataModel.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        currentIndex = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        
        // progressView Bar indicator animation
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 2
        basicAnimation.duration = 1
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "strokeEnd")
        
        switch currentIndex {
        case 0:
            shapeLayer.strokeEnd = CGFloat.pi / 9
        case 1:
            shapeLayer.strokeEnd = CGFloat.pi / 5
        case 2:
            shapeLayer.strokeEnd = CGFloat.pi / 3
        default:
            break
        }
        cache.set(false, forKey: "isTabbar")
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
    
    func setLang(){
         dataModel = [
           Introduction(imageName: "introductionImage1", titleText: Lang.getString(type: .startT1), introText: Lang.getString(type: .startD1)),
           Introduction(imageName: "introductionImage2", titleText: Lang.getString(type: .startT2), introText: Lang.getString(type: .startD1)),
           Introduction(imageName: "introductionImage3", titleText: Lang.getString(type: .startT3), introText: Lang.getString(type: .startD1))
       ]
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
        
        switch currentIndex {
        case 0:
            shapeLayer.strokeEnd = CGFloat.pi / 9
        case 1:
            shapeLayer.strokeEnd = CGFloat.pi / 5
        case 2:
            shapeLayer.strokeEnd = CGFloat.pi / 3
        default:
            break
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
        coordinator.animate { [weak self] _ in
            self?.collectionView.collectionViewLayout.invalidateLayout()
            
            if self?.currentIndex == 0 {
                self?.collectionView.contentOffset = .zero
                self?.collectionView.collectionViewLayout.invalidateLayout()
            } else {
                self?.collectionView.collectionViewLayout.invalidateLayout()
                let indexPath = IndexPath(item: self!.currentIndex, section: 0)
                self?.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
        
    }
    
    
}
//MARK: - NnotificationCenter for language changing
extension IntroductionPageVC {
    func observeLangNotif() {
        NotificationCenter.default.addObserver(self, selector: #selector(changLang), name: NSNotification.Name.init(rawValue: "LANGNOTIFICATION"), object: nil)
        print("NotificationCenter StartVC")
    }
    @objc func changLang(_ notification: NSNotification) {
        guard let lang = notification.object as? Int else { return }
        switch lang {
        case 0:
            Cache.save(appLanguage: .uz)
            setLang()
        case 1:
            Cache.save(appLanguage: .ru)
            setLang()
        case 2:
            Cache.save(appLanguage: .en)
            setLang()
        default: break
        }
    }
}
