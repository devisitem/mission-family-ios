//
//  AccountResponse.swift
//  mission-family-ios
//
//  Created by 전태구 on 2022/01/02.
//

import Foundation
import Alamofire

struct AccountResponse: Codable {
    let checkedId: String?
    
    enum CodingKeys: String, CodingKey {
        case checkedId = "checked_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.checkedId = (try? values.decode(String.self, forKey: .checkedId)) ?? nil
    }
}



func get(endPoint: String, requestBody: Codable) -> MissionResponse<AccountResponse>? {
    let host = "http://localhost:8364"
    let url = host + endPoint
    
     var resBody: MissionResponse<AccountResponse>? = nil
    debugPrint("----- Start Connection to Server ----")
    
    
    AF.request(url, method: .get, parameters: requestBody.toDictionary, encoding: URLEncoding.default ).responseDecodable(of: MissionResponse<AccountResponse>.self) {data in
        
        switch data.result {
        case .success:
            debugPrint("result value : \(data.value!)")
        case .failure(let error):
            debugPrint(error)
            return
        }
        
        guard let response = data.response else {
            debugPrint("Error Occured at extract response in data.")
            return
        }
        
        debugPrint("Server response : \(response)")
        
        guard let res = data.value else {
            debugPrint("Can't assign response body with \(String(describing: data.value))")
            return
        }
        resBody = res
        
        debugPrint("resBody1 : \(String(describing: resBody))")
        
        debugPrint("----- End Connection to Server ------")
    }
    
    return resBody
    
}


func gerData() {
    let url = "http://localhost:8364/api/users/duplicateCheck"
    APIManager.shared.session.request(url).responseData(completionHandler: { res in
        debugPrint(res)
        
    })
}
