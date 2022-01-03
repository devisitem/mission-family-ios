//
//  APIManager.swift
//  mission-family-ios
//
//  Created by 전태구 on 2022/01/03.
//

import Foundation
import Alamofire

final class APIManager {
    
    
    static let shared = APIManager()
    
    
    let interceptors = Interceptor(interceptors:
                        [
                            BaseInterceptor()
                        ])
    
//    let monitors =
    
    var session: Session
    
    private init() {
        session = Session(interceptor: interceptors)
    }
}
