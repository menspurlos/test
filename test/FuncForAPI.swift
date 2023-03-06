//
//  FuncForAPI.swift
//  test
//
//  Created by macBook on 05.03.2023.
//

import Foundation
import Alamofire

class FuncForAPI {
    
    var api: APIHttpProtocol
    
    init(api: APIHttpProtocol = APIhttp()) {
        self.api = api
    }
    
    static let funcForAPI = FuncForAPI()
    
    func GetData(complition: @escaping ([Documents]?, _ error: AFError?) -> Void) {
        api.APICall(method: .get, compliteHandler: complition)
    }

    func PostData(complition: @escaping ([CreateDoc]?, _ error: AFError?) -> Void) {
        api.APICall(method: .post, compliteHandler: complition)
    }
        
    
        
}

