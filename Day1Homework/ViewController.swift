//
//  ViewController.swift
//  Day1Homework
//
//  Created by 柳田昌弘 on 2020/11/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet fileprivate dynamic weak var tableView: UITableView! {
        didSet {
            // TODO
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        }
    }
    
    var contents = [Content]()
    var tableViewArray = [UITableViewCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 100
        // Do any additional setup after loading the view.
        
        guard let customTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else {
            return
        }
        
        for _ in 0...10{
            let objContents = Content.create()
            tableViewArray.append(customTableViewCell)
            contents.append(objContents)
        }
        
    }
    deinit {
        // TODO
    }
}
    
extension ViewController: UITableViewDataSource {
        
    /* Required */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return tableViewArray.count
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell) != nil {
            guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "\(CustomTableViewCell.self)", for: indexPath) as? CustomTableViewCell
            else { fatalError("Could not create CustomTableViewCell") }
            
        //if (tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell) != nil {
                //let tableViewCell = self.tableViewArray[indexPath.row]
                
                let lblName = tableViewCell.viewWithTag(1) as! UILabel
                let lblAddress = tableViewCell.viewWithTag(2) as! UILabel
                lblName.text = contents[indexPath.row].name
                lblAddress.text = contents[indexPath.row].address
            
                
                return tableViewCell
                
             }
        return UITableViewCell()
    }

}

