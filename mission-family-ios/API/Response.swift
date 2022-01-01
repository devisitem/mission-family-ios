//
//  Response.swift
//  mission-family-ios
//
//  Created by 전태구 on 2022/01/01.
//

import Foundation
import Alamofire

struct ResponseResult: Codable {
    let code: Int
}

struct Response: Codable {
    let result: ResponseResult
}

func get(endPoint: String, requestBody: AccountRequest) -> Bool {
    let host = "http://localhost:8364"
    let url = host + endPoint
    
    var resBody: [String: Any]
    
    AF.request(url, method: .get, parameters: requestBody.toDictionary, encoding: URLEncoding.default ).response { response in
        
        guard let data = response.data else {
            debugPrint("Error Occured where taken response data. parameter: \(requestBody.toDictionary)")
            return false
        }
        guard resBody = try JSONDecoder().decode(resBody, from: data) else {
            debugPrint("Error Occured where taken response data: \(data)")
            return false
        }
        
        guard let checked = resBody["checked_id"] as? String else {
            debugPrint("Error Occured where taken response Body: \(resBody)")
        }
        if checked == requestBody.user_id {
            return true
        }
        
        return false
    }
            
    
}
