//
//  ExtTableViewController.swift
//  test
//
//  Created by macBook on 05.03.2023.
//

import UIKit

extension TableViewController {
    func allertShow(number: String) {
        
        let alertController = UIAlertController(title: "Create Doc",
                                                message: "document was created, number  \(number)",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
