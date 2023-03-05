//
//  FuncForAPI.swift
//  test
//
//  Created by macBook on 05.03.2023.
//

import Foundation
import Alamofire

class FuncForAPI {
    
    static let funcForAPI = FuncForAPI()
    
    func GetData(complition: @escaping ([Documents]?, _ error: AFError?) -> Void) {
        APIhttp.sharedAPI.APICall(method: .get, compliteHandler: complition)
    }

    func PostData(complition: @escaping ([CreateDoc]?, _ error: AFError?) -> Void) {
        APIhttp.sharedAPI.APICall(method: .post, compliteHandler: complition)
    }
        
        
        
}

