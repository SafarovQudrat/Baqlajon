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
        b.titleLabel?.font = UIFont(name: "System", size: 14)
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
        b.titleLabel?.font = UIFont(name: "System", size: 14)
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
        b.titleLabel?.font = UIFont(name: "System", size: 14)
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
    
    
    
    
    
    
    
//    VIEW DIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        allBtn.layer.borderWidth = 0
        allBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
        allBtn.setTitleColor(.white, for: .normal)
       
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        setNavController()
        self.view.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(allBtn.snp_bottomMargin).inset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MyCourseTVC.self, forCellReuseIdentifier: MyCourseTVC.identifier)
        
        
    }
    func setNavController() {
        navigationController?.navigationBar.update(backgroundColor: .clear,font: UIFont(name: "System", size: 16))
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
    
    

}

//MARK: -UINavigationBar
extension UINavigationBar {
    
    func update(backgroundColor: UIColor? = nil, titleColor: UIColor? = nil, font: UIFont? = nil) {
        
        if #available(iOS 15, *) {                        /*--------------    if iOS 15 is available for device    -----------------*/
            
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()    /*--------------    Navigation Bar Background let know for changing    -----------------*/
            
            if let backgroundColor = backgroundColor {    /*--------------    backgroundColor optional opened    -----------------*/
                appearance.backgroundColor = backgroundColor
            }
            if let font = font {
                appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor!, NSAttributedString.Key.font: font]
            }
            
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
            
        }else {
            
            barStyle = .blackTranslucent
            if let backgroundColor = backgroundColor {
                barTintColor = backgroundColor
            }
            if let titleColor = titleColor {
                titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
            }
        }
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


