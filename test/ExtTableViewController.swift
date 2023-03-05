//
//  ExtTableViewController.swift
//  test
//
//  Created by macBook on 05.03.2023.
//

import UIKit

extension TableViewController {
    
    func allertShow(text: String, title: String) {
    
        let alertController = UIAlertController(title: title,
                                                message: text,
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
