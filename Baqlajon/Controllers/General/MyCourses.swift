//
//  MyCourses.swift
//  Baqlajon
//
//  Created by MacBook Pro on 07/02/23.
//

import UIKit
import SnapKit
class MyCourses: UIViewController {
    
    
    
//VARIABLES
    private var allBtn: UIButton = {
        let b = UIButton()
        b.setTitle("All courses", for: .normal)
        b.setTitleColor(.systemGray2, for: .normal)
        b.titleLabel?.font = UIFont(name: "Poppins", size: 14)
        b.layer.borderWidth = 1
        b.layer.cornerRadius = 8
        b.layer.borderColor = UIColor.systemGray2.cgColor
        b.addTarget(.none, action: #selector(allTapped), for: .touchUpInside)
        return b
    }()
    private var onBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Ongoing", for: .normal)
        b.setTitleColor(.systemGray2, for: .normal)
        b.titleLabel?.font = UIFont(name: "Poppins", size: 14)
        b.layer.borderWidth = 1
        b.layer.cornerRadius = 8
        b.layer.borderColor = UIColor.systemGray2.cgColor
        b.addTarget(.none, action: #selector(onTapped), for: .touchUpInside)
        return b
    }()
    private var compBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Complate", for: .normal)
        b.setTitleColor(.systemGray2, for: .normal)
        b.titleLabel?.font = UIFont(name: "Poppins", size: 14)
        b.layer.borderWidth = 1
        b.layer.cornerRadius = 8
        b.layer.borderColor = UIColor.systemGray2.cgColor
        b.addTarget(.none, action: #selector(complTapped), for: .touchUpInside)
        return b
    }()
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
    private lazy var tableView: UITableView = {
       let tv = UITableView()

        tv.backgroundColor = .clear


        return tv
    }()
    private lazy var myStackV:UIStackView = {
       let s = UIStackView(arrangedSubviews: [stackV,tableView])
        s.spacing = 16
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fill
        
        
        return s
         
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
        
        l.text = "🔥 Sotib olganlar:"
        return l
    }()
    
    var countLbl: UILabel = {
       let l = UILabel()
        l.font = .appFont(ofSize: 14,weight: .semiBold)
        
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
    
    
//    VIEW DIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allBtn.layer.borderWidth = 0
        allBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
        allBtn.setTitleColor(.white, for: .normal)
       
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        setNavController()
        setUpUi()
        myStackV.isHidden = true
//        myView.isHidden = true
    }
    
    func setUpUi() {
        self.view.addSubview(myStackV)
        myStackV.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(allBtn.snp_bottomMargin).inset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.left.right.equalTo(0)
            
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MyCourseTVC.self, forCellReuseIdentifier: MyCourseTVC.identifier)
        
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
        self.view.addSubview(myView)
        myView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
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
        self.view.addSubview(yellowView)
        yellowView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(myView.snp_bottomMargin).inset(0)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
//    SetNavController
    func setNavController() {
        navigationController?.navigationBar.update(backgroundColor: .clear,font: .appFont(ofSize: 16,weight: .medium))
        let leftBtn = UIBarButtonItem(title: "My courses", style: .done, target: self, action: #selector(leftTapped))
        let rightButton = UIBarButtonItem(image:UIImage(named: "alert"), style: .done, target: self, action: #selector(alertTapped))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.4156862745, alpha: 1)
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.2039215686, alpha: 1)
        
    }
    @objc func leftTapped() {
        
    }
    @objc func alertTapped() {
        
    }
//    Btns
    @objc func allTapped() {
        allBtn.layer.borderWidth = 0
        allBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
        allBtn.setTitleColor(.white, for: .normal)
         onBtn.setTitleColor(.systemGray2, for: .normal)
       compBtn.setTitleColor(.systemGray2, for: .normal)
        onBtn.backgroundColor = .clear
        onBtn.layer.borderWidth = 1
      
        compBtn.backgroundColor = .clear
        compBtn.layer.borderWidth = 1
    }
    @objc func onTapped() {
        onBtn.layer.borderWidth = 0
        onBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
        onBtn.setTitleColor(.white, for: .normal)
       allBtn.setTitleColor(.systemGray2, for: .normal)
      compBtn.setTitleColor(.systemGray2, for: .normal)
        allBtn.backgroundColor = .clear
        allBtn.layer.borderWidth = 1
        compBtn.backgroundColor = .clear
        compBtn.layer.borderWidth = 1
    }
    @objc func complTapped() {
        compBtn.layer.borderWidth = 0
        compBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
       compBtn.setTitleColor(.white, for: .normal)
         onBtn.setTitleColor(.systemGray2, for: .normal)
        allBtn.setTitleColor(.systemGray2, for: .normal)
        onBtn.backgroundColor = .clear
        onBtn.layer.borderWidth = 1
        allBtn.backgroundColor = .clear
        allBtn.layer.borderWidth = 1
    }
    
    @objc func btnTapped() {
        let vc = PaymentsVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
    
    
    

}
//MARK: UITableViewDelegate,UITableViewDataSource
extension MyCourses:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCourseTVC.identifier, for: indexPath) as? MyCourseTVC else {return UITableViewCell()}
        cell.backgroundColor = .clear
        return cell
    }


}


