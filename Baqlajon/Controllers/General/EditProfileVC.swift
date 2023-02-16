//
//  EditProfileVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 13/02/23.
//

import UIKit


@available(iOS 13.4, *)
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
        b.addTarget(.none, action: #selector(changeNumTapped), for: .touchUpInside)
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
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        self.view.addSubview(lastStack)
        lastStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.left.right.equalToSuperview().inset(16)
        }
        setPickerView()
        setDataPicker()
        self.view.addGestureRecognizer (UITapGestureRecognizer(target: self, action: #selector (hideKeyboard)))
    }
    
    //MARK: -  hide keyboard
    @objc private func hideKeyboard() {
        self.view.endEditing (true)
    }
    
    func setDataPicker() {
        datePicker.preferredDatePickerStyle = .wheels
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
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        picker.maximumDate = maxDate
        
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
        navigationController?.navigationBar.update(backgroundColor: .white,font: .appFont(ofSize: 16,weight: .medium))
        navigationItem.title = "Edit profile"
    }
    
    @objc func changeNumTapped() {
        
    }
    @objc func selectGenderTapped() {
        genderTf.becomeFirstResponder()
        genderTf.inputView = UIPickerView()
        
    }
    @objc func selectDateTapped() {
        
    }
    @objc func changePassTapped() {
        
    }
    @objc func saveTapped() {
        
    }
    
    
    
}
//MARK: - UIPickerViewDelegate, UIPickerViewDataSource

@available(iOS 13.4, *)
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
