//
//  Response.swift
//  mission-family-ios
//
//  Created by 전태구 on 2022/01/01.
//

import Foundation

struct MissionResponse<T: Codable>: Codable {
    let result: ResponseModel?
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case result
        case data = "res_data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.result = (try? values.decode(ResponseModel.self, forKey: .result)) ?? nil
        self.data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}

struct ResponseModel: Codable {
    let code: Int?
    let description: String?
    
}

