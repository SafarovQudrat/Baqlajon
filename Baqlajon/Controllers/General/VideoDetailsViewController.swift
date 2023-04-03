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
        b.setTitle("Mark as completed", for: .normal)
        b.backgroundColor = .appColor(color: .mainBlue)
        b.layer.cornerRadius = 8
        b.addTarget(.none, action: #selector(btnTapped), for: .touchUpInside)
        return b
    }()
    
    private lazy var videoView:UIView = {
        let v = UIView()
        v.backgroundColor = .gray
        v.layer.cornerRadius = 8
        return v
    }()
    private lazy var titleLbl:UILabel = {
        let l = UILabel()
        l.font = .appFont(ofSize: 20,weight: .medium)
        l.textColor = .appColor(color: .black1)
        l.text = "3D Design Illustration"
        return l
    }()
    private lazy var textLbl:UILabel = {
        let l = UILabel()
        l.font = .appFont(ofSize: 16)
        l.textColor = .appColor(color: .gray1)
        l.numberOfLines = 0
        l.text = "This course will help others. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
       
        return l
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
        
        view.addSubview(videoView)
        videoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(200)
            
        }
        view.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(videoView.snp_bottomMargin).inset(-16)
            make.left.right.equalToSuperview().inset(16)
        }
        view.addSubview(textLbl)
        textLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp_bottomMargin).inset(-16)
            make.left.right.equalToSuperview().inset(16)
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
