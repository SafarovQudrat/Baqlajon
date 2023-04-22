//
//  ReviewVC.swift
//  Baqlajon
//
//  Created by Ali on 19/02/23.
//

import UIKit
import SnapKit
import IQKeyboardManager
class ReviewVC: UIViewController {
    
    //main view
    let review: UIView = {
        let v = UIView()
        v.backgroundColor = .appColor(color: .background)
        return v
    }()
    
    //text "How was your experience with us?"
    var textLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "How was your experience with us?"
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        lbl.textColor = .systemGray
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    //mood image
    let moodImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    //content description
    let contentDescriptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .medium)
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    //view for rating stars-StackView and slider
    let sliderView: UIView = {
        let sv = UIView()
        sv.backgroundColor = .appColor(color: .starBack)
        sv.layer.cornerRadius = 8
        sv.clipsToBounds = true
        return sv
    }()
    
    //stackView for rating star images
    lazy var starImgStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: imgs)
        sv.alignment = .fill
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    
    //stackView for rating star buttons
    lazy var starBtnStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: btns)
        sv.alignment = .fill
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    
    //rating definition image
    let smileImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "trash")
        iv.image = UIImage(named: "smileImg3")
        return iv
    }()
    
    //slider for rating
    let slider: UISlider = {
        let sl = UISlider()
        sl.maximumValue = 5
        sl.minimumValue = 0
        sl.value = 3
        sl.tintColor = .clear
        sl.backgroundColor = .clear
        sl.thumbTintColor = .clear
        sl.maximumTrackTintColor = .clear
        sl.addTarget(.none, action: #selector(sliderChanged), for: .valueChanged)
        return sl
    }()
    
    //star image array
    private var imgs: [UIImageView] = ["star.fill", "star.fill", "star.fill", "star", "star"].map { star in
        let img = UIImageView()
        img.image = UIImage(named: star)
        img.contentMode = .scaleAspectFit
        return img
    }
    
    //star button array
    private var btns: [UIButton] = [0, 1, 2, 3, 4].map { tag in
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.tag = tag
        btn.addTarget(.none, action: #selector(starTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
    
    //textView for comment
    let commentTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .appColor(color: .gray7)
        tv.layer.cornerRadius = 10
        tv.font = .appFont(ofSize: 16)
        tv.toolbarPlaceholder = "Write here"
        tv.layer.borderColor = UIColor.appColor(color: .gray7).cgColor
        tv.layer.borderWidth = 1
        
        
        return tv
    }()
    
    //    textViewBack
    let txtBackV:UIView = {
        let v = UIView()
        v.backgroundColor = .appColor(color: .gray7)
        v.layer.cornerRadius = 8
        return v
    }()
    
    //review send Button
    let sendReviewButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .appColor(color: .mainBlue)
        btn.layer.cornerRadius = 8
        btn.setTitle("Send", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 16, weight: .medium)
        btn.addTarget(.none, action: #selector(sendCommentTapped), for: .touchUpInside)
        return btn
    }()
    
    let scrollV:UIScrollView = {
        let s = UIScrollView()
        s.showsHorizontalScrollIndicator = false
        s.showsVerticalScrollIndicator = false
        s.isScrollEnabled = true
        return s
    }()
    
    
    
    var courseID: String = ""
    
    //MARK: -viewDidLoad-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appColor(color: .background)
        setUpUI()
        IQKeyboardManager.shared().isEnabled = true
        setNavController()
        setLang()
        observeLangNotif()
    }
    
    
    func setUpUI() {
        
        view.addSubview(review)
        review.snp.makeConstraints { $0.left.right.top.bottom.equalTo(view) }
        
        review.addSubview(textLbl)
        textLbl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(24)
            make.right.left.equalTo(review).inset(24)
        }
        
        review.addSubview(smileImg)
        smileImg.snp.makeConstraints { make in
            make.top.equalTo(textLbl.snp.bottom).offset(30)
            make.centerX.equalTo(review)
            make.height.width.equalTo(view.frame.height/6)
        }
        
        review.addSubview(sliderView)
        sliderView.snp.makeConstraints { make in
            make.top.equalTo(smileImg.snp.bottom).offset(50)
            make.left.right.equalTo(review).inset(48)
        }
        
        sliderView.addSubview(starImgStackView)
        starImgStackView.snp.makeConstraints { make in
            make.height.equalTo(46)
            cornerForView(cas: 3)
            make.left.right.equalTo(sliderView).inset(1)
            make.top.bottom.equalTo(sliderView).inset(1)
        }
        
        sliderView.addSubview(starBtnStackView)
        starBtnStackView.snp.makeConstraints { make in
            make.height.equalTo(46)
            cornerForView(cas: 3)
            make.left.right.equalTo(sliderView).inset(1)
            make.top.bottom.equalTo(sliderView).inset(1)
        }
        
        sliderView.addSubview(slider)
        slider.snp.makeConstraints { make in
            make.right.left.equalTo(sliderView).inset(1)
            make.top.bottom.equalTo(sliderView).inset(1)
        }
        
        review.addSubview(txtBackV)
        commentTextView.addDoneButtonOnKeyboard()
        txtBackV.snp.makeConstraints { make in
            make.top.equalTo(sliderView.snp.bottom).offset(40)
            make.right.left.equalTo(review).inset(50)
            make.height.equalTo(view.frame.height/6)
        }
        txtBackV.addSubview(commentTextView)
        commentTextView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(8)
        }
        
        
        review.addSubview(sendReviewButton)
        sendReviewButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
            make.left.right.equalTo(review).inset(24)
            make.height.equalTo(48)
            
        }
        
    }
    func setNavController() {
        navigationController?.navigationBar.update(backgroundColor:.appColor(color: .white),titleColor: .appColor(color: .black1),font: .appFont(ofSize: 16,weight: .medium))
        navigationItem.title = "Reviews"
        
    }
    
}


extension ReviewVC {
    
    //send review button tapped
    @objc func sendCommentTapped() {
        Loader.start()
        createComment()
        commentTextView.text = ""
    }
    
    
    //
    @objc func starTapped(sender: UIButton) {
        
        switch sender.tag {
        case 0:  // 1star
            slider.value = 0.66
            cornerForView(cas: 1)
            smileImg.image = UIImage(named: "smileImg1")
            
        case 1:  // 2star
            slider.value = 1.75
            cornerForView(cas: 2)
            smileImg.image = UIImage(named: "smileImg2")
            
        case 2: // 3star
            slider.value = 2.84
            cornerForView(cas: 3)
            smileImg.image = UIImage(named: "smileImg3")
            
        case 3: // 4star
            slider.value = 3.92
            cornerForView(cas: 4)
            smileImg.image = UIImage(named: "smileImg4")
            
        case 4: // 5star
            slider.value = 5
            cornerForView(cas: 5)
            smileImg.image = UIImage(named: "smileImg5")
            
        default:
            print("default")
        }
        
    }
    
    
    
    
    //slider Button
    @objc func sliderChanged(sender: UISlider) {
        switch sender.value {
        case let x where x < 1:              // 1star
            sender.value = 0.66
            cornerForView(cas: 1)
            smileImg.image = UIImage(named: "smileImg1")
            
        case let x where x > 1 && x < 2.3:   // 2star
            sender.value = 1.75
            cornerForView(cas: 2)
            smileImg.image = UIImage(named: "smileImg2")
            
        case let x where x > 2.3 && x < 3.5: // 3star
            sender.value = 2.84
            cornerForView(cas: 3)
            smileImg.image = UIImage(named: "smileImg3")
            
        case let x where x > 3.5 && x < 4.5: // 4star
            sender.value = 3.92
            cornerForView(cas: 4)
            smileImg.image = UIImage(named: "smileImg4")
            
        case let x where x > 4.5:            // 5star
            sender.value = 5
            cornerForView(cas: 5)
            smileImg.image = UIImage(named: "smileImg5")
            
        default:
            print("default")
        }
        print(sender.value)
    }
    
    
    //cuts right side corners of view
    func rightCornerRadius(v: UIView, cut: Int) {
        if cut == 1 {
            v.layer.cornerRadius = 8
            v.layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }else if cut == 2 {
            v.layer.cornerRadius = 0
        }else {
            v.layer.cornerRadius = 8
            v.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMinXMinYCorner]
        }
    }
    
    //star conditions in different cases
    func cornerForView(cas: Int) {
        switch cas {
        case 1:
            imgs[0].image = UIImage(named: "star.fill")
            imgs[1].image = UIImage(named: "star")
            imgs[2].image = UIImage(named: "star")
            imgs[3].image = UIImage(named: "star")
            imgs[4].image = UIImage(named: "star")
            
            imgs[0].backgroundColor = .appColor(color: .gray7)
            imgs[1].backgroundColor = .appColor(color: .starBack)
            imgs[2].backgroundColor = .appColor(color: .starBack)
            imgs[3].backgroundColor = .appColor(color: .starBack)
            imgs[4].backgroundColor = .appColor(color: .starBack)
            
            imgs[0].layer.cornerRadius = 8
            rightCornerRadius(v: imgs[1], cut: 2)
            rightCornerRadius(v: imgs[2], cut: 2)
            rightCornerRadius(v: imgs[3], cut: 2)
            rightCornerRadius(v: imgs[4], cut: 2)
            
        case 2:
            imgs[0].image = UIImage(named: "star.fill")
            imgs[1].image = UIImage(named: "star.fill")
            imgs[2].image = UIImage(named: "star")
            imgs[3].image = UIImage(named: "star")
            imgs[4].image = UIImage(named: "star")
            
            imgs[0].backgroundColor = .appColor(color: .gray7)
            imgs[1].backgroundColor = .appColor(color: .gray7)
            imgs[2].backgroundColor = .appColor(color: .starBack)
            imgs[3].backgroundColor = .appColor(color: .starBack)
            imgs[4].backgroundColor = .appColor(color: .starBack)
            
            rightCornerRadius(v: imgs[0], cut: 3)
            rightCornerRadius(v: imgs[1], cut: 1)
            rightCornerRadius(v: imgs[2], cut: 2)
            rightCornerRadius(v: imgs[3], cut: 2)
            rightCornerRadius(v: imgs[4], cut: 2)
            
        case 3:
            imgs[0].image = UIImage(named: "star.fill")
            imgs[1].image = UIImage(named: "star.fill")
            imgs[2].image = UIImage(named: "star.fill")
            imgs[3].image = UIImage(named: "star")
            imgs[4].image = UIImage(named: "star")
            
            imgs[0].backgroundColor = .appColor(color: .gray7)
            imgs[1].backgroundColor = .appColor(color: .gray7)
            imgs[2].backgroundColor = .appColor(color: .gray7)
            imgs[3].backgroundColor = .appColor(color: .starBack)
            imgs[4].backgroundColor = .appColor(color: .starBack)
            
            rightCornerRadius(v: imgs[0], cut: 3)
            rightCornerRadius(v: imgs[1], cut: 2)
            rightCornerRadius(v: imgs[2], cut: 1)
            rightCornerRadius(v: imgs[3], cut: 2)
            rightCornerRadius(v: imgs[4], cut: 2)
            
        case 4:
            imgs[0].image = UIImage(named: "star.fill")
            imgs[1].image = UIImage(named: "star.fill")
            imgs[2].image = UIImage(named: "star.fill")
            imgs[3].image = UIImage(named: "star.fill")
            imgs[4].image = UIImage(named: "star")
            
            imgs[0].backgroundColor = .appColor(color: .gray7)
            imgs[1].backgroundColor = .appColor(color: .gray7)
            imgs[2].backgroundColor = .appColor(color: .gray7)
            imgs[3].backgroundColor = .appColor(color: .gray7)
            imgs[4].backgroundColor = .appColor(color: .starBack)
            
            rightCornerRadius(v: imgs[0], cut: 3)
            rightCornerRadius(v: imgs[1], cut: 2)
            rightCornerRadius(v: imgs[2], cut: 2)
            rightCornerRadius(v: imgs[3], cut: 1)
            rightCornerRadius(v: imgs[4], cut: 2)
            
        case 5:
            imgs[0].image = UIImage(named: "star.fill")
            imgs[1].image = UIImage(named: "star.fill")
            imgs[2].image = UIImage(named: "star.fill")
            imgs[3].image = UIImage(named: "star.fill")
            imgs[4].image = UIImage(named: "star.fill")
            
            imgs[0].backgroundColor = .appColor(color: .gray7)
            imgs[1].backgroundColor = .appColor(color: .gray7)
            imgs[2].backgroundColor = .appColor(color: .gray7)
            imgs[3].backgroundColor = .appColor(color: .gray7)
            imgs[4].backgroundColor = .appColor(color: .gray7)
            
            rightCornerRadius(v: imgs[0], cut: 3)
            rightCornerRadius(v: imgs[1], cut: 2)
            rightCornerRadius(v: imgs[2], cut: 2)
            rightCornerRadius(v: imgs[3], cut: 2)
            rightCornerRadius(v: imgs[4], cut: 1)
            
        default:
            print("")
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if commentTextView.text.isEmpty {
            commentTextView.text = "Placeholder"
            commentTextView.textColor = .red
        }
    }
    
    
    func setLang() {
        textLbl.text = Lang.getString(type: .reviewLbl)
    }
}
extension ReviewVC {
    func createComment() {
        API.createComment(id: courseID, text: commentTextView.text) { data in
            print("Comment = ",data)
            Loader.stop()
            if data["success"].boolValue {
                self.navigationController?.popViewController(animated: true)
            }else {
                Alert.showAlert(title: data["message"].stringValue, message: data["message"].stringValue, vc: self)
            }
        }
    }
}
//MARK: - NnotificationCenter for language changing
extension ReviewVC {
    func observeLangNotif() {
        NotificationCenter.default.addObserver(self, selector: #selector(changLang), name: NSNotification.Name.init(rawValue: "LANGNOTIFICATION"), object: nil)
        print("NotificationCenter StartVC")
    }
    @objc func changLang(_ notification: NSNotification) {
        guard let lang = notification.object as? Int else { return }
        switch lang {
        case 0:
            Cache.save(appLanguage: .uz)
            setLang()
        case 1:
            Cache.save(appLanguage: .ru)
            setLang()
        case 2:
            Cache.save(appLanguage: .en)
            setLang()
        default: break
        }
    }
}

