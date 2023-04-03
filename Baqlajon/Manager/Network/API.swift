//
//  API.swift
//  Baqlajon
//
//  Created by MacBook Pro on 29/03/23.
//

import Foundation
import Alamofire

class API {
    
//    BaseURL
   static let baseURL = "https://baqlajonapi.roundedteam.uz/"
    
//    URLs
    
    static let registerUrl:String = baseURL + "user"
    static let signInUrl:String = baseURL + "user/login"
    static let registerOtpUrl:String = baseURL + "user/register/sendOtp"
    static let sendOtp:String = baseURL + "user/sendOtp"
    static let checkOtp:String = baseURL + "user/checkOtp"
    static let forgetPassword:String = baseURL + "user/forget"
    static let getAllCourseUrl:String = baseURL + "course"
    static let getMyCourseUrl:String = baseURL + "myCourse/all"
    static let giftUrl:String = baseURL + "gift"
//    MARK: -functions
//    register
    static func register(lastName:String,firstName:String,number:String, password:String, complation:@escaping (LoginDM)->Void) {
        
        let param:[String:Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "password": password,
            "phoneNumber": number
        ]
        let header:HTTPHeaders = [
            "lang":"uz"
        ]
        
        Net.sendRequest(to: registerUrl, method: .post, headers: header, param: param) { data in
            guard let data = data else { return }
            complation(LoginDM(json: data))
            cache.set(data["data"]["token"].stringValue, forKey: "TOKEN")
            cache.set(data["data"]["data"]["_id"].stringValue, forKey: "USER_ID")
            cache.set(data["data"]["data"]["phoneNumber"].stringValue, forKey: "USER_PHONE_NUMBER")
            cache.set(data["data"]["data"]["lastName"].stringValue + " " + data["data"]["data"]["firstName"].stringValue, forKey: "USER_NAME")
            cache.set(data["data"]["data"]["firstName"].stringValue, forKey: "PROFILENAME")
            
        }
    }
    
//    RegisterOtp
    static func registerOtp(number:String,complation:@escaping(LoginDM)->Void){
        let param:[String:Any] = [
            "phoneNumber":number,
            
        ]
        let header:HTTPHeaders = [
            "lang":"uz"
        ]
        Net.sendRequest(to: registerOtpUrl, method: .post, headers: header, param: param) { data in
            guard let data = data else {return}
            
            complation(LoginDM(json: data))
        }
    }
    
//    Login
    static func getLogin(number:String,password:String,complation:@escaping(LoginDM)->Void){
        let param:[String:Any] = [
            "phoneNumber":number,
            "password":password
        ]
        let header:HTTPHeaders = [
            "lang":"uz"
        ]
        
        Net.sendRequest(to: signInUrl, method: .post, headers: header, param: param) { data in
            guard let data = data else {return}
            complation(LoginDM(json: data))
            print("LOginDM ===",LoginDM(json: data))
            cache.set(data["data"]["token"].stringValue, forKey: "TOKEN")
            cache.set(data["data"]["data"]["_id"].stringValue, forKey: "USER_ID")
            cache.set(data["data"]["data"]["phoneNumber"].stringValue, forKey: "USER_PHONE_NUMBER")
            cache.set(data["data"]["data"]["lastName"].stringValue + " " + data["data"]["data"]["firstName"].stringValue, forKey: "USER_NAME")
       
        }
    }
    
//    SendOtp
    static func sendOtp(number:String,complation:@escaping(LoginDM)->Void){
        let param:[String:Any] = [
            "phoneNumber":number,
            
        ]
        let header:HTTPHeaders = [
            "lang":"uz"
        ]
        Net.sendRequest(to: sendOtp, method: .post, headers: header, param: param) { data in
            guard let data = data else {return}
            
            complation(LoginDM(json: data))
        }
    }
    
//    CheckOtp
    static func checkOtp(number:String,otp:String,complation:@escaping(LoginDM)->Void){
        let param:[String:Any] = [
            "phoneNumber":number,
            "otp":otp
        ]
        let header:HTTPHeaders = [
            "lang":"uz"
        ]
        Net.sendRequest(to: checkOtp, method: .post, headers: header, param: param) { data in
            guard let data = data else {return}
            complation(LoginDM(json: data))
        }
    }
    
//    Forget Password
    static func forgetPass(number:String,complation:@escaping(LoginDM)->Void){
        let param:[String:Any] = [
            "phoneNumber":number
        ]
        Net.sendRequest(to: forgetPassword, method: .put, headers: nil, param: param) { data in
            guard let data = data else {return}
            complation(LoginDM(json: data))
        }
    }
    
//    GetMyself
    static func getMySelf(complation:@escaping (LoginDM)->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":"uz"
        ]
        Net.sendRequest(to: registerUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else{return}
            complation(LoginDM(json: data))
        }
    }
    
//    getAllCourse
    static func getAllCourse(exUrl:String,complation:@escaping (LoginDM)->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":"uz"
        ]
     
        Net.sendRequest(to: getAllCourseUrl+exUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            print("Json data = ",data)
            complation(LoginDM(json: data))
         
        }
        
        
        
    }
    
//    GetMyCourse
    static func getMyCourse(complation:@escaping([MyCourseDM])->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":"uz"
        ]
        Net.sendRequest(to: getMyCourseUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            let info = data.arrayValue.map{MyCourseDM(json: $0)}
            complation(info)
                    
        }
      
    }
    static func getAllGift(complation:@escaping([GetGiftDM])->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":"uz"
        ]
        Net.sendRequest(to: giftUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            
            let info = data["data"].arrayValue.map{GetGiftDM(json: $0)}
            complation(info)
        }
    }
    
    
    
    
}
