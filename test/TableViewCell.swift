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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(object: Documents) {
        typeLabel.text = object.type
        numberLabel.text = object.number
        dateLabel.text = object.date
        if object.status == false {
            statusLabel.text = "Не проведён"
        } else {
            statusLabel.text = "Проведён"
        }
        if object.delete == true {
            statusLabel.text = "Удален"
        }
        
    }

}
