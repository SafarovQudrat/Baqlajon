//
//  PaymentHistoryViewController.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 19/02/23.
//

import UIKit

class PaymentHistoryViewController: UIViewController {
    
    private let historyTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PaymentHistoryTableViewCell.self, forCellReuseIdentifier: PaymentHistoryTableViewCell.identifier)
        tableView.backgroundColor = UIColor.appColor(color: Colors.background)
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    let refreshControl = UIRefreshControl()
    var timer:Timer?
    var time: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appColor(color: Colors.background)
        
        configureNavigationBar()
        configureConstraints()
        configureTableView()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
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
    
    private func configureNavigationBar() {
        title = "Payment history"
        navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white),titleColor: .appColor(color: .black1))
        
        navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
    }
    @objc func refresh(_ sender: AnyObject) {
        historyTableView.reloadData()
    }
    
    
    
    private func configureTableView() {
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.separatorStyle = .none
        historyTableView.refreshControl = refreshControl
    }
    
    
    private func configureConstraints() {
        view.addSubview(historyTableView)
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: view.topAnchor),
            historyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            historyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            historyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}


extension PaymentHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentHistoryTableViewCell.identifier, for: indexPath) as? PaymentHistoryTableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
}
