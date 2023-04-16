//
//  API.swift
//  Baqlajon
//
//  Created by MacBook Pro on 29/03/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
   static let lang = UserDefaults.standard.string(forKey:Cache.app_langauge)
    
    
//    BaseURL
   static let baseURL = "https://baqlajonapi.roundedteam.uz/"
    static let imgBaseURL: String = "https://baqlajonapi.roundedteam.uz/public/uploads"
//    URLs
    
    static let registerUrl:String = baseURL + "user"
    static let signInUrl:String = baseURL + "user/login"
    static let registerOtpUrl:String = baseURL + "user/register/sendOtp"
    static let sendOtp:String = baseURL + "user/sendOtp"
    static let checkOtp:String = baseURL + "user/checkOtp"
    static let forgetPassword:String = baseURL + "user/forget"
    static let getAllCourseUrl:String = baseURL + "course"
    static let getMyCourseUrl:String = baseURL + "myCourse/all"
    static let getMyCourseStatUrl:String = baseURL + "myCourse/status"
    static let giftUrl:String = baseURL + "gift"
    static let promoCodeUrl:String = baseURL + "promocode"
    static let createCommentUrl:String = baseURL + "comment/"
    static let getAllComments:String = baseURL + "comment/All/"
    static let getImageUrl: String = baseURL + "/public/uploads"
    static let updatePhone: String = baseURL + "/user/phone"
    static let startCourseUrl: String = baseURL + "myCourse/start/"
    static let finishCourseUrl: String = baseURL + "video/finish/"
    static let allVideoUrl: String = baseURL + "video/"
    static let getByIDUrl: String = baseURL + "course/"
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
            "lang":lang ?? "en"
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
            "lang":lang ?? "en"
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
            "lang":lang ?? "en"
        ]
        
        Net.sendRequest(to: signInUrl, method: .post, headers: header, param: param) { data in
            guard let data = data else {return}
            complation(LoginDM(json: data))
            print("LOginDM ===",LoginDM(json: data))
            cache.set(data["data"]["token"].stringValue, forKey: "TOKEN")
            cache.set(data["data"]["data"]["_id"].stringValue, forKey: "USER_ID")
            cache.set(data["data"]["data"]["phoneNumber"].stringValue, forKey: "USER_PHONE_NUMBER")
            cache.set(data["data"]["data"]["lastName"].stringValue + " " + data["data"]["data"]["firstName"].stringValue, forKey: "USER_NAME")
            cache.set(data["data"]["data"]["firstName"].stringValue, forKey: "PROFILENAME")
       
        }
    }
    
//    SendOtp
    static func sendOtp(number:String,complation:@escaping(LoginDM)->Void){
        let param:[String:Any] = [
            "phoneNumber":number,
            
        ]
        let header:HTTPHeaders = [
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: sendOtp, method: .post, headers: header, param: param) { data in
            guard let data = data else {return}
            
            complation(LoginDM(json: data))
        }
    }
    
//    CheckOtp
    static func checkOtp(number: String,otp: String,complation:@escaping(LoginDM)-> Void){
        let param:[String:Any] = [
            "phoneNumber":number,
            "otp":otp
        ]
        let header:HTTPHeaders = [
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: checkOtp, method: .post, headers: header, param: param) { data in
            guard let data = data else {return}
            complation(LoginDM(json: data))
        }
    }
    
//    Forget Password
    static func forgetPass(number: String,password: String,complation:@escaping (JSON)-> Void){
        let param:[String:Any] = [
            "phoneNumber":number,
            "password":password
        ]
        let headers:HTTPHeaders = [
            
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: forgetPassword, method: .put, headers: headers, param: param) { data in
            guard let data = data else {return}
            complation(data)
        }
    }
    
//    GetMyself
    static func getMySelf(complation:@escaping (JSON)->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: registerUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else{return}
            complation(data)
        }
    }
    
//    getAllCourse
    static func getAllCourse(exUrl:String,complation:@escaping (LoginDM)->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
     
        Net.sendRequest(to: getAllCourseUrl+exUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            complation(LoginDM(json: data))
         
        }
        
        
        
    }
    
//    GetMyCourse
    static func getMyCourse(complation:@escaping([MyAllCourseDM])->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: getMyCourseUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            let info = data["data"].arrayValue.map{MyAllCourseDM(json: $0)}
            complation(info)
                    
        }
      
    }
    
    
    
    static func getAllGift(complation:@escaping([GetGiftDM])->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: giftUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            
            let info = data["data"].arrayValue.map{GetGiftDM(json: $0)}
            complation(info)
        }
    }
    
    static func updateUser(name:String,lastname:String,password:String,image:String,number:String,complation:@escaping(JSON)->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        let param:[String:Any] = [
                "firstName": name,
                "lastName": lastname,
                "password": password,
                "image": image,
                "phoneNumber": number,
               
        ]
        Net.sendRequest(to: registerUrl, method: .put, headers: headers, param: param) { data in
            guard let data = data else{return}
            
            complation(data)
        }
    }
    
    static func getPromoCode(complation:@escaping (JSON)->Void) {
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: promoCodeUrl, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            complation(data)
        }
    }
    
    static func createComment(id: String,text:String, complation:@escaping(JSON)->Void) {
        let param:[String:Any] = [
            "text":text
        ]
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: createCommentUrl + id, method: .post, headers: headers, param: param) { data in
            guard let data = data else{return}
            complation(data)
        }
        
        
    }
    
    static func getComments(id: String,complation:@escaping ([CommentDM])->Void) {
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: getAllComments + id, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            let info = data["data"].arrayValue.map{CommentDM(text: $0)}
            complation(info)
           
        }
    }
    
    static func updatePhoneNumber(number: String,otp: String, complation:@escaping(JSON)->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        let param:[String:Any] = [
            "phoneNumber": number,
            "otp":otp
        ]
        Net.sendRequest(to: updatePhone , method: .put, headers: headers, param: param) { data in
            guard let data = data else {return}
            complation (data)
        }
        
    }
   
    static func startCourse(id:String, complation:@escaping(LoginDM)->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        
        Net.sendRequest(to: startCourseUrl + id, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            let info = LoginDM(json: data)
            complation(info)
        }
        
    }
    
    static func finishCourse(id:String,complation:@escaping(LoginDM)->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: finishCourseUrl + id, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            let info = LoginDM(json: data)
            complation(info)
        }
    }
    
    static func getVideoByID(id:String,complation:@escaping(JSON)->Void) {
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: allVideoUrl + id, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            
            complation(data)
        }
    }
    
    static func getCourseByID(id:String,complation:@escaping(MyCourseDM)->Void){
        let headers:HTTPHeaders = [
            "Authorization": "Bearer \(cache.string(forKey: "TOKEN") ?? "")",
            "lang":lang ?? "en"
        ]
        Net.sendRequest(to: getByIDUrl + id, method: .get, headers: headers, param: nil) { data in
            guard let data = data else {return}
            complation(MyCourseDM(json: data["data"]))
            
        }
    }
    
}

