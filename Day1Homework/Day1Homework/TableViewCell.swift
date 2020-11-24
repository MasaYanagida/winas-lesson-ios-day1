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
            if let name = contents?.name, let address = contents?.address {
                setInfo(name: name, address: address)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: TableViewCell.identifier)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }
    
    private func setInfo(name: String, address: String) {
        textLabel?.text = name
        detailTextLabel?.text = address
    }
}
