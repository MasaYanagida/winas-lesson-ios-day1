//
//  TableViewCell.swift
//  Day1Homework
//
//  Created by Rasel on 2020/11/25.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier: String = "tableCell"
    
    var contents: Content? {
        didSet {
            guard let contents = contents else { return }
            textLabel?.text = contents.name
            detailTextLabel?.text = contents.address
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: TableViewCell.identifier)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }

}
