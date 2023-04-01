//
//  LoginDM.swift
//  Baqlajon
//
//  Created by MacBook Pro on 29/03/23.
//

import Foundation
import SwiftyJSON

struct LoginDM{
    var success:Bool
    var message:String
    var data:[GetCourseDM]
    
    init(json:JSON){
        
        self.message = json["message"].stringValue
        self.success = json["success"].boolValue
        self.data = json["data"].arrayValue.map{GetCourseDM(json: $0)}
    }
}

struct GetCourseDM {
    var image:String
    var viewCount:Int
    var rating:Int
    var title:String
    var desc:String
    init(json:JSON){
        self.image = json["image"].stringValue
        self.viewCount = json["viewCount"].intValue
        self.rating = json["rating"].intValue
        self.title = json["title"].stringValue
        self.desc = json["description"].stringValue
    }
}



