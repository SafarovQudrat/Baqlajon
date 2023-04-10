//
//  EditProfileVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 13/02/23.
//

import UIKit
import SwiftyJSON
import Alamofire


class EditProfileVC: UIViewController {
    
    //    profile Image
    var profileImage:UIImageView = {
        let i = UIImageView(image: UIImage(named: "avatarImage"))
        i.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        i.layer.cornerRadius = 50
        return i
    }()
    
    //    set Image
    private lazy var editButton:UIButton = {
        let b = UIButton()
        b.backgroundColor = #colorLiteral(red: 0, green: 0.6406018734, blue: 0.9510455728, alpha: 1)
        b.tintColor = .white
        b.setImage(UIImage(named: "pencil"), for: .normal)
        b.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        b.layer.cornerRadius = 15
        return b
    }()
    private lazy var imgBackView:UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.addSubview(profileImage)
        v.addSubview(editButton)
        profileImage.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(0)
        }
        editButton.snp.makeConstraints { make in
            make.right.bottom.equalTo(0)
        }
        return v
    }()
    
    //    nameTF
    lazy var nameTf:UITextField = {
        let t = UITextField()
        t.font = .appFont(ofSize: 16)
        t.textColor = .appColor(color: .black1)
        t.placeholder = "Username"
        return t
    }()
    private lazy var nameV:UIView = {
        let v = UIView()
        v.addSubview(nameTf)
        v.backgroundColor = .appColor(color: .gray6)
        v.layer.cornerRadius = 8
        nameTf.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
            make.right.equalTo(-16)
        }
        return v
    }()
    
    //    numberTf
    lazy var numberTf:UITextField = {
        let t = UITextField()
        t.font = .appFont(ofSize: 14,weight: .medium)
        t.textColor = .appColor(color: .black1)
        t.placeholder = "Phone Number"
        return t
    }()
    lazy var changeNumberBtn:UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setTitle("Change", for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.titleLabel?.font = .appFont(ofSize: 14)
        b.addTarget(.none, action: #selector(changeNumTapped), for: .touchUpInside)
        return b
    }()
    private lazy var numberStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [numberTf,changeNumberBtn])
        s.axis = .horizontal
        s.distribution = .fill
        s.spacing = 0
        s.alignment = .fill
        return s
    }()
    private lazy var numberV:UIView = {
        let v = UIView()
        v.addSubview(numberStack)
        v.backgroundColor = .appColor(color: .gray6)
        v.layer.cornerRadius = 8
        numberStack.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-8)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        return v
    }()
    
    //    genderTf
    lazy var genderTf:UITextField = {
        let t = UITextField()
        t.font = .appFont(ofSize: 16)
        t.textColor = .appColor(color: .black1)
        t.placeholder = "Gender"
        return t
    }()
    
    lazy var selectGender:UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        b.tintColor = .appColor(color: .gray2)
        b.addTarget(.none, action: #selector(selectGenderTapped), for: .touchUpInside)
        return b
    }()
    private lazy var genderStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [genderTf,selectGender])
        genderTf.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(-30)
        }
        s.axis = .horizontal
        s.distribution = .equalSpacing
        s.spacing = 0
        s.alignment = .fill
        return s
    }()
    private lazy var genderV:UIView = {
        let v = UIView()
        v.addSubview(genderStack)
        v.backgroundColor = .appColor(color: .gray6)
        v.layer.cornerRadius = 8
        genderStack.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-8)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        return v
    }()
    
    //    date of birth
    lazy var dateTf:UITextField = {
        let t = UITextField()
        t.font = .appFont(ofSize: 16)
        t.textColor = .appColor(color: .black1)
        t.placeholder = "Date of birth"
        return t
    }()
    lazy var selectDate:UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        b.tintColor = .appColor(color: .gray2)
        b.addTarget(.none, action: #selector(selectGenderTapped), for: .touchUpInside)
        return b
    }()
    private lazy var dateStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [dateTf,selectDate])
        s.axis = .horizontal
        s.distribution = .fill
        s.spacing = 0
        s.alignment = .fill
        return s
    }()
    private lazy var dateV:UIView = {
        let v = UIView()
        v.addSubview(dateStack)
        v.backgroundColor = .appColor(color: .gray6)
        v.layer.cornerRadius = 8
        dateStack.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-8)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        return v
    }()
    
    //    password
    lazy var passwordTf:UITextField = {
        let t = UITextField()
        t.font = .appFont(ofSize: 14,weight: .medium)
        t.textColor = .appColor(color: .black1)
        t.placeholder = "Password"
        return t
    }()
    lazy var changePassBtn:UIButton = {
        let b = UIButton()
        b.backgroundColor = .clear
        b.setTitle("Change Password", for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.titleLabel?.font = .appFont(ofSize: 14)
        b.addTarget(.none, action: #selector(changePassTapped), for: .touchUpInside)
        return b
    }()
    private lazy var passwordStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [passwordTf,changePassBtn])
        s.axis = .horizontal
        s.distribution = .fill
        s.spacing = 0
        s.alignment = .fill
        return s
    }()
    private lazy var passwordV:UIView = {
        let v = UIView()
        v.addSubview(passwordStack)
        v.backgroundColor = .appColor(color: .gray6)
        v.layer.cornerRadius = 8
        passwordStack.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        return v
    }()
    //save Button
    private lazy var saveBtn:BNButton = {
        let b = BNButton()
        b.setTitle("Save", for: .normal)
        b.backgroundColor = .appColor(color: .mainBlue)
        b.addTarget(.none, action: #selector(saveTapped), for: .touchUpInside)
        b.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return b
        
    }()
    
    private lazy var stackV:UIStackView = {
        let s = UIStackView(arrangedSubviews: [nameV,numberV,genderV,dateV,passwordV,saveBtn])
        s.alignment = .fill
        s.axis = .vertical
        s.distribution = .fillEqually
        s.spacing = 16
        return s
    }()
    private lazy var lastStack:UIStackView = {
        let s = UIStackView(arrangedSubviews: [imgBackView,stackV])
        stackV.snp.makeConstraints { make in
            make.left.right.equalTo(0)
        }
        s.axis = .vertical
        s.distribution = .fill
        s.alignment = .center
        s.spacing = 24
        return s
        
    }()
    var genderPicker = UIPickerView ()
    let datePicker = UIDatePicker()
    
    let genders:[String] = ["Male","Female"]
    let addd = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavController()
        self.view.backgroundColor = .appColor(color: .background)
        self.view.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.left.right.equalToSuperview().inset(16)
        }
        setPickerView()
        setDataPicker()
        getMySelf()
        self.view.addGestureRecognizer (UITapGestureRecognizer(target: self, action: #selector (hideKeyboard)))
    }
    
    //MARK: -  hide keyboard
    @objc private func hideKeyboard() {
        self.view.endEditing (true)
    }
    
    func setDataPicker() {
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        
        datePicker.locale = Locale(identifier: "uz_UZ")
        
        datePicker.backgroundColor = .white
        
        setMinMaxDate(picker: datePicker)
        
        dateTf.inputView = datePicker
        
        setToolBar()
        
        datePicker.addTarget(self, action: #selector(changeDatePicker), for: .valueChanged)
        
    }
    @objc func changeDatePicker() {
        
        print("datepicer date = ", datePicker.date)
        
        dateTf.text = convertDateToString(datePicker.date)
        
    }
    func setToolBar() {
        
        let cancel = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelTapped))
        
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        
        
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        
        toolBar.items = [cancel,done]
        
        dateTf.inputAccessoryView = toolBar
        
    }
    
    @objc func cancelTapped() {
        
        dateTf.resignFirstResponder()
        
    }
    @objc func doneTapped() {
        
        dateTf.text = convertDateToString(datePicker.date)
        dateTf.resignFirstResponder()
    }
    
    func setMinMaxDate(picker: UIDatePicker) {
        
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        components.year = 0
        components.month = 12
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        components.year = -60
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        picker.maximumDate = maxDate
        picker.minimumDate = minDate
        
    }
    
    func convertDateToString(_ date: Date) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd.MM.YYYY "
        
        formatter.locale = Locale(identifier: "uz_UZ")
        
        let dateStr = formatter.string(from: date)
        
        return dateStr
        
    }
    
    func setPickerView() {
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderTf.inputView = genderPicker
    }
    
    
    
    
    
    //    setNavigation Controller
    func setNavController() {
        navigationController?.navigationBar.update(backgroundColor:.appColor(color: .white),titleColor: .appColor(color: .black1),font: .appFont(ofSize: 16,weight: .medium))
        navigationItem.title = "Edit profile"
        let leftBtn = UIBarButtonItem(image:UIImage(systemName: "chevron.left"), style: .done, target:self , action: #selector(backBtnTapped) )
        navigationItem.leftBarButtonItem = leftBtn
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem?.tintColor =  .appColor(color: .black3)
        navigationItem.leftBarButtonItem?.tintColor = .appColor(color: .black1)
    }
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func changeNumTapped() {
        cache.set(true, forKey: "changeNumber")
        self.navigationController?.pushViewController(ForgotVC(), animated: true)
        
    }
    @objc func selectGenderTapped() {
        genderTf.becomeFirstResponder()
        genderTf.inputView = UIPickerView()
        
    }
    @objc func selectDateTapped() {
        
    }
    @objc func changePassTapped() {
        let vc = ResetPasswordVC()
        vc.changPass = { data in
            if data != "" {
                self.passwordTf.text = data
            }
           
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func saveTapped() {
        Loader.start()
        updateData()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension EditProfileVC:UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return genders.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        genderTf.text = genders[row]
        //        self.view.endEditing(true)
    }
    
}
extension EditProfileVC{
    func updateData(){
        Loader.stop()
        guard let imageData = profileImage.image!.jpegData(compressionQuality: 0.5) else {return}
       
        API.updateUser(name: nameTf.text!, lastname: "", password: passwordTf.text!, image:  imageData.base64EncodedString(), number: numberTf.text!) { [self] data in
            if data["success"].boolValue {
                nameTf.text = data["data"]["firstName"].stringValue
                numberTf.text = data["data"]["phoneNumber"].stringValue
                passwordTf.text = data["data"]["password"].stringValue
                let data = try? Data(contentsOf:  URL(string: data["data"]["image"].stringValue)!)
                if let imageData = data {
                    self.profileImage.image = UIImage(data: imageData)
                }
            }else {
                Alert.showAlert(title: data["message"].stringValue, message: data["message"].stringValue, vc: self)
            }
        }
        
    }
    func getMySelf(){
        API.getMySelf { [self] data in
            if data["success"].boolValue {
                nameTf.text = data["data"]["firstName"].stringValue
                numberTf.text = data["data"]["phoneNumber"].stringValue
                passwordTf.text = data["data"]["password"].stringValue
                let url = URL(string: data["data"]["image"].stringValue)
                guard let url = url else {return}
                let data = try? Data(contentsOf: url)
                if let imageData = data {
                    self.profileImage.image = UIImage(data: imageData)
                }
            }else {
                Alert.showAlert(title: data["message"].stringValue, message: data["message"].stringValue, vc: self)
            }
        }
    }
}

