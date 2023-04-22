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
        v.addSubview(videoImage)
        videoImage.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(0)
        }
        return v
    }()
    private lazy var videoImage:UIImageView = {
        let v = UIImageView(image: UIImage(named: "courseImage"))
        v.contentMode = .scaleAspectFill
        v.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
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
    private lazy var playBtn:UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        b.tintColor = .white
        b.addTarget(.none, action: #selector(playBtnTapped), for: .touchUpInside)
        b.imageView?.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 100)
        b.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 50), forImageIn: .normal)
        b.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        return b
    }()
    var isFullScreen = false
    let videoPlayerView = UIView()
    var player: AVPlayer!
    var playerLayer:AVPlayerLayer!
    var videoID:String = ""
    var url:URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
        configureNavigationBar()
        Loader.start()
        getVideoByID()
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
            make.top.equalTo(videoView.snp_bottomMargin).offset(70)
            make.left.right.equalToSuperview().inset(16)
        }
        view.addSubview(textLbl)
        textLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp_bottomMargin).inset(-16)
            make.left.right.equalToSuperview().inset(16)
        }
        
        
        
        videoView.addSubview(playBtn)
        playBtn.snp.makeConstraints { make in
            make.centerX.equalTo(videoView.snp_centerXWithinMargins).inset(0)
            make.centerY.equalTo(videoView.snp_centerYWithinMargins).inset(0)
            
        }
        
        
    }
    private func configureNavigationBar() {
        title = "Video details"
        
        navigationController?.navigationBar.update(backgroundColor: .appColor(color: .white))
        
        
        
    }
    
    
    @objc func btnTapped(){
        Loader.start()
        finishVideo()
        
        
    }
    @objc func playBtnTapped() {
        cache.set(videoID, forKey: "VIDEO_ID")
        setUpVideoPlayer(url: url)
    }
    
    
    
    
}
//MARK: Video Player
extension VideoDetailsViewController {
    func setUpVideoPlayer(url:URL?) {
        
        guard let url = url else {
            return
        }
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true)
    }
}
//MARK: - API
extension VideoDetailsViewController {
    func finishVideo(){
        API.finishCourse(id: videoID) { data in
            Loader.stop()
            if data.success {
                Alert.showAlert(title: data.message, message: data.message, vc: self)
            }else {
                Alert.showAlert(title: data.message, message: data.message, vc: self)
            }
        }
    }
    
    func getVideoByID() {
        API.getVideoByID(id: videoID) { data in
            Loader.stop()
            if data["success"].boolValue {
                print("DATAAAAAA===",data)
                if data["data"]["isFree"].boolValue {
                    self.url = URL(string: API.imgBaseURL + data["data"]["videoUrl"].stringValue)
                    self.videoImage.sd_setImage(with: URL(string: API.imgBaseURL + data["data"]["imageUrl"].stringValue))
                    self.titleLbl.text = data["data"]["title"].stringValue
                    self.textLbl.text = data["data"]["description"].stringValue
                }else {
                    Alert.showAlert(title: "Error", message: "This video not Free", vc: self)
                }
            }else {
                Alert.showAlert(title: "Error", message: "NO Result!", vc: self)
            }
        }
    }
    
}
