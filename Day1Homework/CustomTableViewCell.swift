//
//  CustomTableViewCell.swift
//  Day1Homework
//
//  Created by sugi on 2020/11/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

   
    @IBOutlet weak var imgPicture: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAddress1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
