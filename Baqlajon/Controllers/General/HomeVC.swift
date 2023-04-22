//
//  HomeVC.swift
//  Baqlajon
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    //    course payment view
    private lazy var backPaymentV:UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
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
        l.textColor = .black
        l.text = "🔥 Sotib olganlar:"
        return l
    }()
    var countLbl: UILabel = {
        let l = UILabel()
        l.font = .appFont(ofSize: 14,weight: .semiBold)
        l.textColor = .black
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
    
    //    category btns
    private var allBtn: UIButton = {
        let b = UIButton()
        b.setTitle("All courses", for: .normal)
        b.setTitleColor(.appColor(color: .gray2), for: .normal)
        b.titleLabel?.font = UIFont(name: "Poppins", size: 14)
        b.layer.borderWidth = 1
        b.layer.cornerRadius = 8
        b.layer.borderColor = UIColor.systemGray3.cgColor
        b.addTarget(.none, action: #selector(allTapped), for: .touchUpInside)
        return b
    }()
    private var onBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Popular", for: .normal)
        b.setTitleColor(.systemGray2, for: .normal)
        b.titleLabel?.font = UIFont(name: "Poppins", size: 14)
        b.layer.borderWidth = 1
        b.layer.cornerRadius = 8
        b.layer.borderColor = UIColor.systemGray3.cgColor
        b.addTarget(.none, action: #selector(onTapped), for: .touchUpInside)
        return b
    }()
    private var compBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Newest", for: .normal)
        b.setTitleColor(.systemGray2, for: .normal)
        b.titleLabel?.font = UIFont(name: "Poppins", size: 14)
        b.layer.borderWidth = 1
        b.layer.cornerRadius = 8
        b.layer.borderColor = UIColor.systemGray3.cgColor
        b.addTarget(.none, action: #selector(complTapped), for: .touchUpInside)
        return b
    }()
    //    constants
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
    
    //    search Bar
    private lazy var searchV:UIView = {
        let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.layer.cornerRadius = 8
        v.addSubview(searchStackV)
        searchStackV.snp.makeConstraints { make in
            make.top.left.equalTo(13)
            make.bottom.right.equalTo(-13)
        }
        return v
    }()
    private lazy var searchTF:UITextField = {
        let t = UITextField()
        t.textColor = .appColor(color: .black1)
        t.placeholder = "Search"
        t.font = .appFont(ofSize: 16)
        
        return t
    }()
    private lazy var searchImage:UIImageView = {
        let s = UIImageView()
        s.image = UIImage(systemName: "magnifyingglass")
        s.tintColor = .systemGray2
        s.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        return s
    }()
    private lazy var searchStackV:UIStackView = {
        let s = UIStackView(arrangedSubviews: [searchImage,searchTF])
        s.alignment = .fill
        s.axis = .horizontal
        s.distribution = .fill
        s.spacing = 0
        return s
    }()
    //    Collectionviews
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CoursesCVC.self, forCellWithReuseIdentifier: "CoursesCVC")
        collectionView.isPagingEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    //    profile
    lazy var backProfileV:UIView={
        let v = UIView()
        v.backgroundColor = .appColor(color: .white)
        v.addSubview(imagePBackV)
        imagePBackV.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.bottom.equalTo(-8)
        }
        v.addSubview(lblStackV)
        lblStackV.snp.makeConstraints { make in
            make.left.equalTo(imagePBackV.snp_rightMargin).offset(12)
            make.bottom.equalTo(-8)
        }
        
        
        return v
    }()
    private lazy var imageP:UIImageView = {
        let i = UIImageView()
        i.image = UIImage(systemName: "person.circle")
        i.clipsToBounds = true
        i.tintColor = .appColor(color: .gray2)
        i.layer.cornerRadius = 20
        
        i.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        return i
    }()
    private lazy var imagePBackV:UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(imageP)
        
        imageP.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
        return v
    }()
    private lazy var imgPBtn:UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        return b
    }()
    
    
    
    private lazy var hiLbl:UILabel = {
        let l = UILabel()
        l.font = .appFont(ofSize: 12)
        l.textColor = .appColor(color: .gray1)
        l.text = "Hello!"
        return l
    }()
    private lazy var usernameLbl:UILabel = {
        let l = UILabel()
        l.textColor = .appColor(color: .black1)
        l.font = .appFont(ofSize: 16)
        l.text = cache.string(forKey: "USER_NAME")
        return l
    }()
    private lazy var lblStackV:UIStackView = {
        let s = UIStackView(arrangedSubviews: [hiLbl,usernameLbl])
        s.alignment = .fill
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 0
        return s
    }()
    
    private lazy var lastStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [searchV,stackV,collectionView])
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fill
        s.spacing = 16
        return s
    }()
    
    
    private lazy var noDataLbl:UILabel = {
        let l = UILabel()
        l.text = "No result!"
        l.textColor = .lightGray
        l.font = .appFont(ofSize: 20,weight: .medium)
        return l
    }()
    
    var arr:[GetCourseDM] = []
    var arr1:[GetCourseDM] = []
    let screenSize = UIScreen.main.bounds
    var scrollV = UIScrollView()
    let refreshControl = UIRefreshControl()
    var timer:Timer?
    var time: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setLang()
        observeLangNotif()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        backProfileV.isHidden = false
    }
    
    @objc func action () {
        if time <= 0 {
            timer?.invalidate()
            refreshControl.endRefreshing()
        }else {
            time = time - 1
        }
    }
    //setUpUI
    func setUpUI(){
        self.view.backgroundColor = .appColor(color: .background)
        getMySelf()
        
        allBtn.layer.borderWidth = 0
        allBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
        allBtn.setTitleColor(.white, for: .normal)
        Loader.start()
        if Reachability.isConnectedToNetwork() {
            
            getCourse(exUrl: "")
            collectionView.reloadData()
        }else {
            Alert.showAlert(title: "No internet", message: "No internet connection", vc: self)
            Loader.stop()
        }
        
        searchTF.delegate = self
        myView.isHidden = true
        yellowView.isHidden = true
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        scrollV.addSubview(refreshControl)
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
        collectionView.delegate = self
        collectionView.dataSource = self
        self.navigationController?.view.addSubview(backProfileV)
        backProfileV.snp.makeConstraints { make in
            make.top.left.right.equalTo(0)
            make.height.equalTo(UIScreen.main.bounds.height/8)
        }
        imagePBackV.addSubview(imgPBtn)
        imgPBtn.snp.makeConstraints { make in
            make.bottom.right.left.top.equalTo(0)
        }
        scrollV = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        self.view.addSubview(scrollV)
        scrollV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.left.right.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        scrollV.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(-10)
            make.width.equalTo(scrollV.frame.width - 32)
            make.height.equalTo(scrollV.frame.height - 32)
        }
        view.addSubview(noDataLbl)
        noDataLbl.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }
    }
    
    
    
    //    btnTapped
    @objc func btnTapped(){
        
        let vc = PaymentsVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    @objc func profileTapped(){
        print("Profile Tapped")
        self.tabBarController?.selectedIndex = 3
    }
    
    //    REFRESH func
    @objc func refresh() {
        getMySelf()
        getCourse(exUrl: "")
        collectionView.reloadData()
        refreshControl.endRefreshing()
    }
    
    //    select category btns
    @objc func allTapped() {
        allBtn.layer.borderWidth = 0
        allBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
        allBtn.setTitleColor(.white, for: .normal)
        onBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
        compBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
        onBtn.backgroundColor = .clear
        onBtn.layer.borderWidth = 1
        compBtn.backgroundColor = .clear
        compBtn.layer.borderWidth = 1
        Loader.start()
        if Reachability.isConnectedToNetwork() {
            getCourse(exUrl: "")
        }else {
            Alert.showAlert(title: "No internet", message: "No internet connection!", vc: self)
            Loader.stop()
        }
        collectionView.reloadData()
        searchTF.text = ""
        
    }
    @objc func onTapped() {
        onBtn.layer.borderWidth = 0
        onBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
        onBtn.setTitleColor(.white, for: .normal)
        allBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
        compBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
        allBtn.backgroundColor = .clear
        allBtn.layer.borderWidth = 1
        compBtn.backgroundColor = .clear
        compBtn.layer.borderWidth = 1
        Loader.start()
        if Reachability.isConnectedToNetwork() {
            getCourse(exUrl: "/popular")
        }else {
            Alert.showAlert(title: "No internet", message: "No internet connection!", vc: self)
            Loader.stop()
        }
        
        collectionView.reloadData()
        searchTF.text = ""
    }
    @objc func complTapped() {
        compBtn.layer.borderWidth = 0
        compBtn.backgroundColor = #colorLiteral(red: 0.0493427515, green: 0.5654236078, blue: 0.937621057, alpha: 1)
        compBtn.setTitleColor(.white, for: .normal)
        onBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
        allBtn.setTitleColor(.appColor(color: .gray2), for: .normal)
        onBtn.backgroundColor = .clear
        onBtn.layer.borderWidth = 1
        allBtn.backgroundColor = .clear
        allBtn.layer.borderWidth = 1
        Loader.start()
        if Reachability.isConnectedToNetwork() {
            getCourse(exUrl: "/newest")
        }else {
            Alert.showAlert(title: "No internet", message: "No internet connection!", vc: self)
            Loader.stop()
        }
        
        collectionView.reloadData()
        searchTF.text = ""
    }
    
    func setLang() {
        searchTF.placeholder = Lang.getString(type: .searchTf)
        allBtn.setTitle(Lang.getString(type: .homeBtn1), for: .normal)
        onBtn.setTitle(Lang.getString(type: .homeBtn2), for: .normal)
        compBtn.setTitle(Lang.getString(type: .homeBtn3), for: .normal)
        hiLbl.text = Lang.getString(type: .hiLbl)
    }
    
    
    
}
//MARK: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout 
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.backProfileV.isHidden = true
        let vc = CourseDetailsVC()
        vc.myC = { [self]data in
            self.navigationController?.view.addSubview(backProfileV)
            backProfileV.isHidden = false
        }
        vc.course = arr[indexPath.item]._id
        navigationController?.pushViewController(vc, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCVC", for: indexPath) as? CoursesCVC else {return UICollectionViewCell()}
        cell.backgroundColor = .clear
        cell.updateCell(course: arr[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 16)/2, height: 190)
    }
    
}
//MARK: UITextFieldDelegate
extension HomeVC:UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        var arr2:[GetCourseDM] = []
        if textField.text! == "" {
            searchImage.isHidden = false
            getCourse(exUrl: "")
            arr = arr1
            
        }else{
            for i in arr {
                if i.desc.lowercased().contains((textField.text?.lowercased())!)  {
                    arr2.append(i)
                }
            }
            arr = arr2
        }
        if self.arr.isEmpty  {
            self.noDataLbl.isHidden = false
        }else {
            self.noDataLbl.isHidden = true
        }
        collectionView.reloadData()
        
        
    }
}

//MARK: API
extension HomeVC{
    func getCourse(exUrl:String) {
        API.getAllCourse(exUrl: exUrl) { data in
            Loader.stop()
            if data.success {
                self.arr = data.data
                self.arr1 = data.data
                
                if self.arr.isEmpty  {
                    self.noDataLbl.isHidden = false
                }else {
                    self.noDataLbl.isHidden = true
                }
                self.collectionView.reloadData()
                
            }else{
                
            }
        }
    }
    func getMySelf(){
        Loader.start()
        API.getMySelf { [self] data in
            Loader.stop()
            print("data===",data)
            if data["success"].boolValue {
                cache.set(data["data"]["image"].stringValue, forKey: "PROFILE_IMAGE")
                let url = URL(string: API.imgBaseURL + cache.string(forKey: "PROFILE_IMAGE")!)
                
                
                
                if let url = url {
                    print("URL = = ",url)
                    self.imageP.sd_setImage(with: url)
                }else {
                    
                    self.imageP.image = UIImage(named: "avatarImage")
                }
            }else {
                Alert.showAlert(title: data["message"].stringValue, message: data["message"].stringValue, vc: self)
            }
        }
    }
    
}
//MARK: - NnotificationCenter for language changing
extension HomeVC {
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
            getCourse(exUrl: "")
            self.collectionView.reloadData()
        case 1:
            Cache.save(appLanguage: .ru)
            setLang()
            getCourse(exUrl: "")
            self.collectionView.reloadData()
        case 2:
            Cache.save(appLanguage: .en)
            setLang()
            getCourse(exUrl: "")
            self.collectionView.reloadData()
        default: break
        }
    }
}
