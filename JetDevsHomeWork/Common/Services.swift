//
//  Services.swift
//  JetDevsHomeWork
//
//  Created by APPLE on 07/12/22.
//

import Foundation
import ObjectMapper

protocol ServiceProtocol {
    func userLoginWithCredentials(param:[String:Any],completion: @escaping (LoginMapperModel?) -> ())
}


class Services: ServiceProtocol {
    
    func userLoginWithCredentials(param:[String:Any],completion: @escaping ( LoginMapperModel?) -> ()) {
        
        
        
        networkManager.postRequest(login, params: param ?? [:], oauth: true) { (strResponse, error, code) in
            if let error = error {
                print(error.localizedDescription)
            } else {

                let responseModel = Mapper<LoginMapperModel>().map(JSONString: strResponse ?? "")
                completion(responseModel)
            }
        }
        
        
        
    }
    
    
    
}
