//
//  AccountRequest.swift
//  mission-family-ios
//
//  Created by 전태구 on 2022/01/01.
//

import Foundation

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let object = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        guard let dictionary = try? JSONSerialization.jsonObject(with: object, options: []) as? [String:Any] else {
            return nil
        }
        return dictionary
    }
}

protocol MissionRequest : Encodable  {
    
}

class AccountRequest : MissionRequest {
    var user_id: String
    var password: String? = nil
    var user_name: String? = nil
    
    init(id userId: String) {
        self.user_id = userId
    }
    
    init(userId: String, password: String, username: String) {
        self.user_id = userId
        self.password = password
        self.user_name = username
    }
}
