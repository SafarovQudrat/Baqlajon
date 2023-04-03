//
//  ShopVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 03/04/23.
//

import UIKit
import SnapKit
class ShopVC: UIViewController {
   
    private lazy var tableView:UITableView = {
        let t = UITableView()
        t.backgroundColor = .clear
        return t
    }()
    var arr:[GetGiftDM] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor(color: .background)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ShopTVC.self, forCellReuseIdentifier: "ShopTVC")
        configureNavigationBar()
        Loader.start()
        getGift()
    }
    
//    set Navigation Controller
    private func configureNavigationBar() {
        title = "Shop"
        navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white),titleColor: .appColor(color: .black1))
        let leftBtn = UIBarButtonItem(image:UIImage(systemName: "chevron.left"), style: .done, target:self , action: #selector(backBtnTapped) )
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
    }
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    

    
}
//MARK: UITableViewDelegate,UITableViewDataSource
extension ShopVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTVC", for: indexPath) as? ShopTVC else {return UITableViewCell()}
        cell.backgroundColor = .clear
        cell.updateCell(gift: arr[indexPath.row])
        return cell
                
    }
}
extension ShopVC{
    func getGift(){
        API.getAllGift { data in
            Loader.stop()
            self.arr = data
            self.tableView.reloadData()
        }
    }
}
