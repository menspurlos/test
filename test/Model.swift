//
//  Model.swift
//  test
//
//  Created by macBook on 02.03.2023.
//

import Foundation


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

