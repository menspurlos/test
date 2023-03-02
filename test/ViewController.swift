//
//  ViewController.swift
//  test
//
//  Created by macBook on 01.03.2023.
//

import UIKit
import Alamofire




class ViewController: UIViewController {
    
    //let jsonData = Documents(type: <#T##String#>, number: <#T##String#>, date: <#T##String#>, status: <#T##String#>, delete: <#T##String#>, pred: <#T##String#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //create()
        al()
        
        
        
        
        
    }
    
    
    
    
    func create() {
        
        
        let url = "http://5.130.157.177/CBBudzhet/hs/http"
        let dataPeredach: [String : Any] = ["ss": "2", "dd" : true]
        
        print (dataPeredach)
        
        AF.request(url,
                   method: .post,
                   parameters: dataPeredach,
                   encoding: URLEncoding.default ,
                   headers: nil,
                   interceptor: nil
        ).validate().response { responce in
 
        
            switch responce.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([CreateDoc].self, from: data!)
                    print (jsonData[0].number)
                    
                } catch {
                    print (error.localizedDescription)
                }
            case.failure(let error): print (error.localizedDescription)
            }
        }
        
    }
    
    func al () {
        
    // http://5.130.157.177/CBBudzhet/hs/http
        
        let url = "http://5.130.157.177/CBBudzhet/hs/http"
       
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default ,
                   headers: nil,
                   interceptor: nil
        ).validate().response { responce in
 
        
            switch responce.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([Documents].self, from: data!)
                    print (jsonData)
                    
                } catch {
                    print (error.localizedDescription)
                }
            case.failure(let error): print (error.localizedDescription)
            }
        }
          
        

        
    }
    
    
    struct Documents: Codable {
        let type: String
        let number: String
        let date: String
        let status: Bool
        let delete: Bool
        let pred: String
        
    }
    
    struct CreateDoc: Codable {
        let number: String
    }

}

