//
//  HomeVC.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    //    course payment view
    private lazy var backPaymentV:UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    private var myView:UIView = {
       let v = UIView()
        v.snp.makeConstraints { make in
            make.height.equalTo(170)
        }
        v.backgroundColor = .clear
        return v
    }()
        private lazy var imageV:UIImageView = {
           let i = UIImageView(image: UIImage(named: "Background 1"))
            i.contentMode = .scaleAspectFill
            i.clipsToBounds = true
            i.layer.cornerRadius = 10
            return i
        }()
        var titleLbl:UILabel = {
           let l = UILabel()
            l.text = "Lorem ipsum set"
            l.textColor = .white
            l.font = .appFont(ofSize: 22, weight: .medium)
            
            
            return l
        }()
        var textLbl:UILabel = {
           let l = UILabel()
            
            l.textColor = .white
            l.numberOfLines = 0
            l.text = "Pay 99 000 UZS & get all access for a month"
            l.font = .appFont(ofSize: 16)
            return l
        }()
        lazy var lblStack:UIStackView = {
           let s = UIStackView(arrangedSubviews: [titleLbl,textLbl])
            s.distribution = .fill
            s.axis = .vertical
            s.spacing = 8
            s.alignment = .leading
            return s
        }()
        var btnView:UIView = {
            let b = UIView()
            b.layer.cornerRadius = 8
            b.snp.makeConstraints { make in
                make.height.equalTo(36)
            }
            b.backgroundColor = .white
            return b
        }()
        private var lbl:UILabel = {
           let l = UILabel()
           
            l.textColor = .systemBlue
            l.text = "Buy Now"
            l.font = .appFont(ofSize: 14,weight: .medium)
            return l
        }()
        private var img:UIImageView = {
           let i = UIImageView()
            i.image = UIImage(systemName: "chevron.right",withConfiguration: UIImage.SymbolConfiguration(pointSize: 16))
            
            return i
        }()
        private lazy var btnStack:UIStackView = {
           let s = UIStackView(arrangedSubviews: [lbl,img])
            s.alignment = .center
            s.spacing = 8
            s.axis = .horizontal
            s.distribution = .fill
            return s
        }()
        var btn:UIButton = {
           let b = UIButton()
            b.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
            return b
        }()
        lazy var lblBStack:UIStackView = {
           let s = UIStackView(arrangedSubviews: [lblStack,btnView])
            s.distribution = .fill
            s.axis = .vertical
            s.spacing = 16
            s.alignment = .leading
            return s
        }()
        var fireLbl: UILabel = {
           let l = UILabel()
            l.font = .appFont(ofSize: 14)
            l.textColor = .black
            l.text = "🔥 Sotib olganlar:"
            return l
        }()
        var countLbl: UILabel = {
           let l = UILabel()
            l.font = .appFont(ofSize: 14,weight: .semiBold)
            l.textColor = .black
            l.text = "10000"
            return l
        }()
        lazy var yellowStack:UIStackView = {
           let s = UIStackView(arrangedSubviews: [fireLbl,countLbl])
            s.distribution = .fill
            s.axis = .horizontal
            s.spacing = 8
            s.alignment = .fill
            return s
        }()
        var yellowView:UIView = {
           let v = UIView()
            v.backgroundColor = #colorLiteral(red: 0.7612490654, green: 0.9437683225, blue: 0.3503981233, alpha: 1)
            v.layer.cornerRadius = 6
            return v
        }()
    
    //    category btns
        private var allBtn: UIButton = {
            let b = UIButton()
            b.setTitle("All courses", for: .normal)
            b.setTitleColor(.appColor(color: .gray2), for: .normal)
            b.titleLabel?.font = UIFont(name: "Poppins", size: 14)
            b.layer.borderWidth = 1
            b.layer.cornerRadius = 8
            b.layer.borderColor = UIColor.systemGray3.cgColor
            b.addTarget(.none, action: #selector(allTapped), for: .touchUpInside)
            return b
        }()
        private var onBtn: UIButton = {
            let b = UIButton()
            b.setTitle("Popular", for: .normal)
            b.setTitleColor(.systemGray2, for: .normal)
            b.titleLabel?.font = UIFont(name: "Poppins", size: 14)
            b.layer.borderWidth = 1
            b.layer.cornerRadius = 8
            b.layer.borderColor = UIColor.systemGray3.cgColor
            b.addTarget(.none, action: #selector(onTapped), for: .touchUpInside)
            return b
        }()
        private var compBtn: UIButton = {
            let b = UIButton()
            b.setTitle("Newest", for: .normal)
            b.setTitleColor(.systemGray2, for: .normal)
            b.titleLabel?.font = UIFont(name: "Poppins", size: 14)
            b.layer.borderWidth = 1
            b.layer.cornerRadius = 8
            b.layer.borderColor = UIColor.systemGray3.cgColor
            b.addTarget(.none, action: #selector(complTapped), for: .touchUpInside)
            return b
        }()
    //    constants
        private lazy var stackV: UIStackView = {
           let s = UIStackView(arrangedSubviews: [allBtn,onBtn,compBtn])
            s.spacing = 16
            s.axis = .horizontal
            s.alignment = .fill
            s.distribution = .fillEqually
            s.snp.makeConstraints { make in
                make.height.equalTo(34)
            }
            return s
        }()
    
    
    
    
//    search Bar
    private lazy var searchV:UIView = {
       let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 8
        v.addSubview(searchTF)
        searchTF.snp.makeConstraints { make in
            make.top.left.equalTo(10)
            make.bottom.right.equalTo(-10)
        }
        return v
    }()
    private lazy var searchTF:UITextField = {
        let t = UITextField()
        t.textColor = .appColor(color: .black1)
        t.placeholder = "Search"
        t.font = .appFont(ofSize: 16)
        t.addTarget(.none, action: #selector(searchTapped), for: .touchUpInside)
        return t
    }()
    
//    Collectionviews
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CoursesCVC.self, forCellWithReuseIdentifier: "CoursesCVC")
        collectionView.isPagingEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .appColor(color: .background)
        allBtn.layer.borderWidth = 0
        allBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
        allBtn.setTitleColor(.white, for: .normal)
        setNavController()
        setUpUI()
        collectionView.delegate = self
        collectionView.dataSource = self
       
    }
//setUpUI
    func setUpUI(){
        view.addSubview(searchV)
        searchV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        btnView.addSubview(btnStack)
        btnStack.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(16)
            make.top.right.equalToSuperview().inset(4)
            make.centerY.equalToSuperview()
        }
        btnView.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(0)
        }
        view.addSubview(myView)
        myView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(searchV.snp_bottomMargin).inset(-16)
        }
        myView.addSubview(imageV)
        imageV.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(0)
        }
        myView.addSubview(lblBStack)
        lblBStack.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview().inset(16)
            
        }
        yellowView.addSubview(yellowStack)
        yellowStack.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(6)
        }
        view.addSubview(yellowView)
        yellowView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(myView.snp_bottomMargin).inset(0)
        }
        view.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.top.equalTo(yellowView.snp_bottomMargin).inset(-24)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(stackV.snp_bottomMargin).inset(-16)
            make.left.right.bottom.equalToSuperview().inset(16)
            
        }
        
    }
    
    
    
    //    SetNavController
        func setNavController() {
            navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white),font: .appFont(ofSize: 16,weight: .medium))
            let leftBtn = UIBarButtonItem(title: "Home", style: .done, target: self, action: .none)
            let rightButton = UIBarButtonItem(image:UIImage(named: "alert"), style: .done, target: self, action: #selector(alertTapped))
            navigationItem.rightBarButtonItem = rightButton
            navigationItem.leftBarButtonItem = leftBtn
            navigationItem.rightBarButtonItem?.tintColor =  .appColor(color: .black3)
            navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
            
        }
    
    @objc func alertTapped(){
        
    }
//    btnTapped
    @objc func btnTapped(){
        
        let vc = PaymentsVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    @objc func searchTapped(){
        
    }
    
    //    select category btns
        @objc func allTapped() {
            allBtn.layer.borderWidth = 0
            allBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
            allBtn.setTitleColor(.white, for: .normal)
            onBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
           compBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
            onBtn.backgroundColor = .clear
            onBtn.layer.borderWidth = 1
          
            compBtn.backgroundColor = .clear
            compBtn.layer.borderWidth = 1
        }
        @objc func onTapped() {
            onBtn.layer.borderWidth = 0
            onBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
            onBtn.setTitleColor(.white, for: .normal)
           allBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
          compBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
            allBtn.backgroundColor = .clear
            allBtn.layer.borderWidth = 1
            compBtn.backgroundColor = .clear
            compBtn.layer.borderWidth = 1
        }
        @objc func complTapped() {
            compBtn.layer.borderWidth = 0
            compBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
           compBtn.setTitleColor(.white, for: .normal)
             onBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
            allBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
            onBtn.backgroundColor = .clear
            onBtn.layer.borderWidth = 1
            allBtn.backgroundColor = .clear
            allBtn.layer.borderWidth = 1
        }
        
  
}
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCVC", for: indexPath) as? CoursesCVC else {return UICollectionViewCell()}
        cell.backgroundColor = .blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 16)/2, height: 190)
    }
    
}
