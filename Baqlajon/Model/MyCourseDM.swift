//
//  MyCourseDM.swift
//  Baqlajon
//
//  Created by MacBook Pro on 02/04/23.
//

import Alamofire
import SwiftyJSON


struct MyCourseDM{
    var videos:GetCourseDM
    init(json: JSON) {
        self.videos = GetCourseDM(json: json["data"]["course"])
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
