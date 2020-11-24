//
//  UserCell.swift
//  Day1Homework
//
//  Created by naoto on 2020/11/24.
//

import UIKit

class UserCell: UITableViewCell {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    func setup(name: String, address: String) {
        nameLabel!.text = name
        addressLabel!.text = address
    }
}
