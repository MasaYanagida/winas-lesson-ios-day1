//
//  HomeTableViewCell.swift
//  Day1Homework
//
//  Created by Ahsan on 2020/11/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    var content: Content? {
        didSet {
            guard let content = self.content else {
                return
            }
            nameLabel.text = content.name
            addressLabel.text = content.address
        }
    }
}
