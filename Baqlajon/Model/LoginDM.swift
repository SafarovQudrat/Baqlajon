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
    var _id:String
    var isFree:Bool
    var image:String
    var videoImage: String
    var viewCount:Int
    var rating:Int
    var title:String
    var desc:String
    var videoCount:Int
    var video:String
    var studentCount:Int
    init(json:JSON){
        self._id = json["_id"].stringValue
        self.image = json["image"].stringValue
        self.viewCount = json["viewCount"].intValue
        self.rating = json["rating"].intValue
        self.title = json["title"].stringValue
        self.desc = json["description"].stringValue
        self.videoCount = json["videoCount"].intValue
        self.video = json["videoUrl"].stringValue
        self.isFree = json["isFree"].boolValue
        self.videoImage = json["imageUrl"].stringValue
        self.studentCount = json["studentCount"].intValue
    }
}



