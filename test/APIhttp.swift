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
    var docs = [Documents]()

    func create(compliteHandler: @escaping (_ dataAPI:[CreateDoc]) -> Void) {
        AF.request(url,
                   method: .post,
                   parameters: nil,
                   encoding: URLEncoding.default ,
                   headers: nil,
                   interceptor: nil
        ).validate().response { responce in

            switch responce.result {
            case .success(let data):
                do {
                    let dataAPI = try JSONDecoder().decode([CreateDoc].self, from: data!)
                    compliteHandler(dataAPI)
                } catch {
                    print (error.localizedDescription)
                }
            case .failure(let error): print (error.localizedDescription)
            }
        }
    }
    
    func GetDocs(compliteHandler: @escaping (_ dataAPI:[Documents]) -> Void) {
        AF.request(self.url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default ,
                   headers: nil,
                   interceptor: nil
        ).validate().response { responce in
              
            switch responce.result {
            case .success(let data):
                do {
                    let dataAPI = try JSONDecoder().decode([Documents].self, from: data!)
                    compliteHandler(dataAPI)
                } catch {
                    print (error.localizedDescription)
                }
            case.failure(let error): print (error.localizedDescription)
            }
        }
    }
    
}
