//
//  NetworkManager.swift
//  JetDevsHomeWork
//
//  Created by APPLE on 07/12/22.
//

import Foundation
import Alamofire


class NetworkManager: NSObject {
    
    static let sharedInstance = NetworkManager()
    private var jsonStrings:String?
    
    
    
    func postRequest(_ url: String, params: [String: Any]?, oauth: Bool, result: @escaping (String?, _ error: NSError?, _ statuscode: Int) -> ()) {
        
        var accessToken = ""
        
        let headers = ["Authorization" : accessToken,
                       "Content-Type": "application/json"]
        
        print("HEader \(headers)")
        
        AF.request(url, method: .post, parameters:params)
            .responseJSON { response in
                print("PostPrameters - \(params)")
                print("URL - \(url)")
                print("response - \(response)")

                // Check status code 403 for authentication
                if response.result == nil {
                    //printLog(log: response.response!.statusCode)
                   // let jsonResponse = JSON(data: response.data!)
                  //  print("JSON - \(jsonResponse)")
                   // let jsonObject = jsonResponse.dictionary
                    result(nil, nil, 0)
                } else {
                    result(nil, nil, 0)
                }
            }
    }
    
    
}
    
    
    
    
    
    
