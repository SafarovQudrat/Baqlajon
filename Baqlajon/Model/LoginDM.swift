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
    
    
    init(json:JSON){
        
        self.message = json["message"].stringValue
        self.success = json["success"].boolValue
    }
}



