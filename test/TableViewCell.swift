//
//  TableViewCell.swift
//  test
//
//  Created by macBook on 02.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    
    func set(object: Documents) {
        typeLabel.text = object.type
        numberLabel.text = object.number
        dateLabel.text = object.date
        if object.status == false {
            statusLabel.text = "Не проведён"
            statusImage.image = UIImage(named: "noprov")
        } else {
            statusLabel.text = "Проведён"
            statusImage.image = UIImage(named: "prov")
        }
        if object.delete == true {
            statusLabel.text = "Удален"
            statusImage.image = UIImage(named: "del")
        }
    }

}
