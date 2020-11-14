//
//  ContentTableViewCell.swift
//  Day1Homework
//
//  Created by 柳田昌弘 on 2020/11/14.
//

import UIKit

// MARK: - ContentTableViewCell

class ContentTableViewCell: UITableViewCell {
    
    // MARK: Internal
    var content: Content? {
        didSet {
            guard let content = self.content else {
                return
            }
            iconView.image = UIImage(named: content.iconName)
            nameLabel.text = content.name
            addressLabel.text = content.address
        }
    }
    
    // MARK: Private
    @IBOutlet fileprivate dynamic weak var nameLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var addressLabel: UILabel!
    @IBOutlet fileprivate dynamic weak var iconView: UIImageView!
}
