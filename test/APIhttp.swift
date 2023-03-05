//
//  API.swift
//  test
//
//  Created by macBook on 02.03.2023.
//

import Foundation
import Alamofire

class APIhttp {
    
    static let sharedAPI = APIhttp()
    
    let url = "http://5.130.157.177/CBBudzhet/hs/http"
    
    func APICall<T: Decodable>(method: HTTPMethod, compliteHandler: @escaping (_ dataAPI:[T]) -> Void) {
        AF.request(url,
                   method: method,
                   parameters: nil,
                   encoding: URLEncoding.default ,
                   headers: nil,
                   interceptor: nil
        ).validate().response { responce in

            switch responce.result {
            case .success(let data):
                do {
                    let dataAPI = try JSONDecoder().decode([T].self, from: data!)
                    compliteHandler(dataAPI)
                } catch {
                    print (error.localizedDescription)
                }
            case .failure(let error): print (error.localizedDescription)
            }
        }
    }
    
}
