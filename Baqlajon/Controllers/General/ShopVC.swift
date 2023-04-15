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
    let refreshControl = UIRefreshControl()
    var timer:Timer?
    var time: Int = 1
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
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
        configureNavigationBar()
        Loader.start()
        if Reachability.isConnectedToNetwork() {
            getGift()
        }else {
            Loader.stop()
            Alert.showAlert(title: "No Internet!!!", message: "No Internet!!!", vc: self)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
    }
    
    @objc func action () {
        if time <= 0 {
            timer?.invalidate()
            refreshControl.endRefreshing()
        }else {
            time = time - 1
        }
    }
    
    
//    set Navigation Controller
    private func configureNavigationBar() {
        title = "Shop"
        navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white),titleColor: .appColor(color: .black1))
        
    }
    
    @objc func refresh(_ sender: AnyObject) {
        getGift()
        tableView.reloadData()
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
