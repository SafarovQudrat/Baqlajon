//
//  VideoDetailsVC.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 09/02/23.
//

import UIKit
import AVKit
import AVFoundation
import SnapKit
class VideoDetailsViewController: UIViewController {
    
    private lazy var btn:UIButton = {
        let b = UIButton()
        b.setTitle("Play", for: .normal)
        b.backgroundColor = .blue
        b.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
        return b
    }()
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setUpUi()
        configureNavigationBar()
    }
    private func setUpUi() {
        view.backgroundColor = .appColor(color: .background)
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
        }
    }
    private func configureNavigationBar() {
        title = "Video details"
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white))
        let leftBtn = UIBarButtonItem(image:UIImage(systemName: "chevron.left"), style: .done, target:self , action: #selector(backtapped) )
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.rightBarButtonItem?.tintColor =  .appColor(color: .black3)
        navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
    }
    //    back Button
        @objc func backtapped(){
            self.navigationController?.popViewController(animated: true)
        }

   
    @objc func btnTapped(){
        
        
        let vc = AVPlayerViewController()
        let url = Bundle.main.url(forResource: "video", withExtension: "MP4")!
        let player = AVPlayer(url:url)
        present(vc, animated: true)
    }
}
