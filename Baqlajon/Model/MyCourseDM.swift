//
//  MyCourseDM.swift
//  Baqlajon
//
//  Created by MacBook Pro on 02/04/23.
//

import Alamofire
import SwiftyJSON


struct MyCourseDM{
    var info:GetCourseDM
    var freeVideos:[GetCourseDM]
    var videos:[GetCourseDM]
    var comment:[CommentDM]
    init(json: JSON) {
        self.info = GetCourseDM(json: json)
        self.videos = json["video"].arrayValue.map{GetCourseDM(json: $0)}
        self.freeVideos = json["freeVideo"].arrayValue.map{GetCourseDM(json: $0)}
        self.comment = json["comment"].arrayValue.map{CommentDM(text: $0)}
    }
}

struct MyAllCourseDM{
    
    var videos:GetCourseDM
    init(json: JSON) {
      
        self.videos = GetCourseDM(json: json["course"])
    }
}

struct GetGiftDM{
    var image:String
    var coin:Int
    var name:String
    init(json:JSON) {
        self.image = json["image"].stringValue
        self.coin = json["coin"].intValue
        self.name = json["name"].stringValue
    }
}

struct CommentDM{
    var text:String
    var rating:Int
    init(text: JSON) {
        self.text = text["text"].stringValue
        self.rating = text["rating"].intValue
    }
}
