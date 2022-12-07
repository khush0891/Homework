//
//  LoginModel.swift
//  JetDevsHomeWork
//
//  Created by APPLE on 07/12/22.
//

import Foundation
import ObjectMapper

/* Model holds application data - it’s usually structs or simple classes. */

class LoginModel {
    
    var emailId: String = ""
    var password: String = ""
   
    
    convenience init(emailId : String, password : String) {
        self.init()
        self.emailId = emailId
        self.password = password
    }
    
}


class LoginMapperModel : Mappable {
    
    var result : Int?
    var errorMessage : String?
    var data : UserMapperModel?


    required init?(map: Map) {

    }
    
    init() {
        
    }

    func mapping(map: Map) {

        result <- map["result"]
        errorMessage <- map["error_message"]
        data <- map["data"]

    }
    
}

class UserMapperModel : Mappable {
    
    var userid : Int?
    var username : String?
    var userprofileurl : String?


    required init?(map: Map) {

    }
    
    init() {
        
    }

    func mapping(map: Map) {

        userid <- map["user_id"]
        username <- map["user_name"]
        userprofileurl <- map["user_profile_url"]

    }
    
}
