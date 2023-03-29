//
//  NET.swift
//  Baqlajon
//
//  Created by Chingiz Jumanov on 07/02/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class Net {
    
    
    class func req(urlAPI: String, method: HTTPMethod, withLoader: Bool = true, params: [String : Any]?, complition: @escaping (_ data: JSON?) -> () ) {
        
        if Reachability.isConnectedToNetwork() {
            if withLoader {Loader.start()}
            AF.request(urlAPI, method: method, parameters: params, encoding: JSONEncoding.default, headers: returnHeader(type: .not_token)).responseData { (response) in
                Loader.stop()
                if let data = response.data {
                    
                    complition(JSON(data))
                } else {
                    complition(nil)
                    
                }
            }
        } else {
            
        }
    }
    class func reqWithToken(urlAPI: String, method: HTTPMethod, withLoader: Bool = true, params: [String : Any]?, encoding: ParameterEncoding = JSONEncoding.default, complition: @escaping (_ data: JSON?) -> () ) {
        
        if Reachability.isConnectedToNetwork() {
            if withLoader {Loader.start()}
            AF.request(urlAPI, method: method, parameters: params, encoding: encoding, headers: returnHeader(type: cache.string(forKey: "TOKEN")!.isEmpty ? .not_token : .with_token)).responseData { (response) in
                Loader.stop()
                
                if let data = response.data {
                    
                    
                    complition(JSON(data))
                } else {
                    complition(nil)
                    
                }
            }
        } else {
            
        }
    }
    class func reqWithTokenURLEncoding(urlAPI: String, method: HTTPMethod, withLoader: Bool = true, params: [String : Any]?, complition: @escaping (_ data: JSON?) -> () ) {
        
        if Reachability.isConnectedToNetwork() {
            if withLoader {Loader.start()}
            var header: HTTPHeaders = [ "Content-Type": "application/x-www-form-urlencoded"]
            if !(cache.string(forKey: "TOKEN") ?? "").isEmpty {
                header["Authorization"] = "Bearer \(String(describing: cache.string(forKey: "TOKEN")))"
            }
            
            AF.request(urlAPI, method: method, parameters: params, encoding: URLEncoding.httpBody, headers: header).responseData { (response) in
                Loader.stop()
                
                if let data = response.data {
                    
                    complition(JSON(data))
                } else {
                    complition(nil)
                    
                }
            }
        } else {
            //            Error.showView(type: .intenet)
        }
    }
    class func reqMultiPart(urlAPi: String, params: [String:String], method: HTTPMethod, completion: @escaping (_ data: JSON?) -> ()) {
        
        if Reachability.isConnectedToNetwork() {
            Loader.start()
            let header: HTTPHeaders = [
                "Authorization": "Bearer \(String(describing: cache.string(forKey: "TOKEN")))",
                "Content-Type": "application/x-www-form-urlencoded",
            ]
            
            AF.upload(multipartFormData: { multipartFormData in
                for (key, value) in params {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to: urlAPi, method: method, headers: header).responseData { (response) in
                Loader.stop()
                
                switch response.result {
                case .success:
                    
                    completion(JSON(response.data!))
                case .failure:
                    completion(nil)
                    
                }
            }
        } else {
            //            Error.showView(type: .intenet)
        }
    }
    
    
    enum HeaderType {
        case with_token
        case not_token
        case login
    }
    
    class func returnHeader(type: HeaderType) -> HTTPHeaders {
        switch type {
            
        case .with_token:
            return [
                "Authorization": "Bearer \(String(describing: cache.string(forKey: "TOKEN")))",
                "Content-Type": "application/json",
                "Accept" : "application/json"
            ]
        case .not_token:
            return [
                "Accept" : "application/json"
            ]
        case .login:
            return [:
            ]
        }
    }
    
    
}
