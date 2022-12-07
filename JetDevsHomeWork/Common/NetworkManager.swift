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
    
    
    
    func postRequest(_ url: String, params: [String: Any]?, oauth: Bool, result: @escaping (String?, _ error: Error?, _ statuscode: Int) -> ()) {
        
        var accessToken = ""
        
        let headers = ["Authorization" : accessToken,
                       "Content-Type": "application/json"]
        
        print("HEader \(headers)")
        let paramData = try? JSONSerialization.data(withJSONObject: params, options: [])

        let paramsData: Parameters = params!
        
        AF.request(url, method: .post, parameters: paramsData, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in

                print("PostPrameters - \(paramsData)")
                print("URL - \(url)")
                print("response - \(response)")
                                
                switch response.result {
                           case .success(let data):
                                 print(data)
                            do {
                                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                                    print("Error: Cannot convert data to JSON object")
                                    return
                                }
                                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                                    print("Error: Cannot convert JSON object to Pretty JSON data")
                                    return
                                }
                                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                                    print("Error: Could print JSON in String")
                                    return
                                }
                                print(prettyPrintedJson)
                                result(prettyPrintedJson, nil, 200)

                                } catch {
                                    print("Error: Trying to convert JSON data to string")
                                    return
                                }
                    
                           case .failure(let error):
                               print(error)
                           result(nil, nil, 500)
                           }
            }
    }
    
    
}
    
    
    
    
    
    
