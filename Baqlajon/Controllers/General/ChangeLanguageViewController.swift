//
//  ChangeLanguageViewController.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 18/02/23.
//

import UIKit

class ChangeLanguageViewController: UIViewController {
    
    private let languageTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChangeLanguageTableViewCell.self, forCellReuseIdentifier: ChangeLanguageTableViewCell.identifier)
        tableView.backgroundColor = UIColor.appColor(color: Colors.background)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.appColor(color: Colors.background)
        
        configureConstraints()
        configureNavigationBar()
        configureTableView()
    }
    
    
    private func configureTableView() {
        languageTableView.delegate = self
        languageTableView.dataSource = self
        languageTableView.separatorStyle = .none
        languageTableView.separatorInset = UIEdgeInsets(top: 8, left: .zero, bottom: 8, right: .zero)
    }
    
    
    private func configureNavigationBar() {
        title = "Change language"
        navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white),titleColor: .appColor(color: .black1))
        let leftBtn = UIBarButtonItem(image:UIImage(systemName: "chevron.left"), style: .done, target:self , action: #selector(backBtnTapped) )
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem?.tintColor =  .appColor(color: .black3)
        navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
    }
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }

    
    private func configureConstraints() {
        view.addSubview(languageTableView)
        NSLayoutConstraint.activate([
            languageTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            languageTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            languageTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            languageTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension ChangeLanguageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChangeLanguageTableViewCell.identifier, for: indexPath) as? ChangeLanguageTableViewCell else { return UITableViewCell() }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
    }
    
}
