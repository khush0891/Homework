//
//  Services.swift
//  JetDevsHomeWork
//
//  Created by APPLE on 07/12/22.
//

import Foundation
import ObjectMapper


protocol ServiceProtocol {
    func userLoginWithCredentials(param:[String:Any],completion: @escaping (LoginMapperModel?, String?) -> ())
}


class Services: ServiceProtocol {
        
    func userLoginWithCredentials(param: [String : Any], completion: @escaping (LoginMapperModel?, String?) -> ()) {
        
        networkManager.postRequest(login, params: param ?? [:], oauth: true) { (strResponse, error, code) in
            let responseModel = Mapper<LoginMapperModel>().map(JSONString: strResponse ?? "")

            if let error = error {
                print(error.localizedDescription)
                completion(responseModel,"error")
            } else {

                let responseModel = Mapper<LoginMapperModel>().map(JSONString: strResponse ?? "")
                completion(responseModel,"")
            }
        }
        
    }
    
    
    
}
