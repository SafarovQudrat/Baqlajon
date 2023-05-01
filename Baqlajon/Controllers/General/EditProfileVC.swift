//
//  EditProfileVC.swift
//  Baqlajon
//
//  Created by MacBook Pro on 13/02/23.
//

import UIKit
import SwiftyJSON
import Alamofire
import SDWebImage

class EditProfileVC: UIViewController {
    
    //    profile Image
    var profileImage:UIImageView = {
        let i = UIImageView()
        i.image = UIImage(systemName: "person.circle")
        i.tintColor = .appColor(color: .gray2)
        i.layer.cornerRadius = 50
        i.clipsToBounds = true
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
        b.addTarget(.none, action: #selector(editButtonTapped), for: .touchUpInside)
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
        t.inputView = UIView()
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
        t.inputView = UIPickerView()
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
        b.addTarget(.none, action: #selector(selectDateTapped), for: .touchUpInside)
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
        t.isSecureTextEntry = true
        t.placeholder = "Password"
        t.inputView = UIView()
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
        
        datePicker.backgroundColor = .clear
        
        setMinMaxDate(picker: datePicker)
        
        dateTf.inputView = datePicker
        
        setToolBar()
        
        datePicker.addTarget(self, action: #selector(changeDatePicker), for: .valueChanged)
        
    }
    @objc func changeDatePicker() {
        
        dateTf.text = convertDateToString(datePicker.date)
        
    }
    func setToolBar() {
        
        let cancel = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelTapped))
        
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        var spaceView = UIBarButtonItem()
        if #available(iOS 14.0, *) {
             spaceView = UIBarButtonItem(systemItem: .flexibleSpace)
        }
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        
        toolBar.items = [cancel,spaceView,done]
        
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
    
    @objc func editButtonTapped() {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = .savedPhotosAlbum
        image.allowsEditing = true
        
        self.present(image, animated: true)
    }
    
    
    
    
    //    setNavigation Controller
    func setNavController() {
        navigationController?.navigationBar.update(backgroundColor:.appColor(color: .white),titleColor: .appColor(color: .black1),font: .appFont(ofSize: 16,weight: .medium))
        navigationItem.title = "Edit profile"
        
    }
    
    
    @objc func changeNumTapped() {
        cache.set(true, forKey: "changeNumber")
        navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(ForgotVC(), animated: true)
        
    }
    @objc func selectGenderTapped() {
        genderTf.becomeFirstResponder()
    }
    @objc func selectDateTapped() {
        dateTf.becomeFirstResponder()
    }
    @objc func changePassTapped() {
        let vc = ResetPasswordVC()
        vc.changPass = { data in
            if data != "" {
                self.passwordTf.text = data
            }
            
        }
        navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func saveTapped() {
        Loader.start()
        sendSignature { [self] data in
            guard let data = data  else {return}
            print("data iMage = ",data)
            cache.set(nameTf.text!, forKey: "USER_NAME")
            cache.set(data["data"].stringValue, forKey: "PROFILE_IMAGE")
            updateData(img: data["data"].stringValue)
        }
        
        
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
//MARK:
extension EditProfileVC:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let reciveImage = info[.originalImage] as? UIImage
        let editImage = info[.editedImage] as? UIImage
        self.profileImage.image = editImage
        self.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
}

extension EditProfileVC {
    
    func sendSignature(completion: @escaping (_ data: JSON?) -> ()) {
        if Reachability.isConnectedToNetwork() {
            
            AF.upload(multipartFormData: { [self] multipartFormData in
                if let imgData = profileImage.image?.jpegData(compressionQuality: 0.6) {
                    multipartFormData.append(imgData, withName: "file", fileName: "\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
                }
            }, to: "https://baqlajonapi.roundedteam.uz/image/upload", method: .post).response { (response) in
                
                Loader.stop()
                
                switch response.result {
                case .success:
                    if let data = response.data {
                        
                        completion(JSON(data))
                    } else {
                        completion(nil)
                    }
                case .failure:
                    
                    completion(nil)
                }
            }
        } else {
            
            //Not Connected
        }
    }
}

extension EditProfileVC{
    
    func updateData(img:String){
        Loader.stop()
        API.updateUser(name: nameTf.text!, lastname: "", password: passwordTf.text!, image: img, number: numberTf.text!) { [self] data in
            if data["success"].boolValue {
                nameTf.text = data["data"]["firstName"].stringValue
                numberTf.text = data["data"]["phoneNumber"].stringValue
                passwordTf.text = data["data"]["password"].stringValue
                cache.set(data["data"]["image"].stringValue, forKey: "PROFILE_IMAGE")
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
        Loader.start()
        API.getMySelf { [self] data in
            Loader.stop()
            if data["success"].boolValue {
                nameTf.text = data["data"]["firstName"].stringValue
                numberTf.text = data["data"]["phoneNumber"].stringValue
                passwordTf.text = data["data"]["password"].stringValue
                let url = URL(string: API.imgBaseURL + cache.string(forKey: "PROFILE_IMAGE")!)
                
                if let url = url {
                    if cache.string(forKey: "PROFILE_IMAGE")! == "" {
                        self.profileImage.image = UIImage(systemName: "person.circle")
                    }else {
                        self.profileImage.sd_setImage(with: url)
                    }
                    
                }else {
                    self.profileImage.image = UIImage(named: "avatarImage")
                }
                
            }else {
                Alert.showAlert(title: data["message"].stringValue, message: data["message"].stringValue, vc: self)
            }
        }
    }
}

