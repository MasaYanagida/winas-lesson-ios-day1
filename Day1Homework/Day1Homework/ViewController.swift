//
//  ViewController.swift
//  Day1Homework
//
//  Created by 柳田昌弘 on 2020/11/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet fileprivate dynamic weak var tableView: UITableView! {
        didSet {
            startObserving()
        }
    }
    var contents = [Content]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func startObserving() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.willEnterForeground),
                                               name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
      @objc func willEnterForeground() {
        contents = []
        
        for i in 1...10 {
            contents.append(Content.create())
        }
        
        tableView.reloadData()
      }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = contents[(indexPath as NSIndexPath).row].name
        cell.detailTextLabel?.text = contents[(indexPath as NSIndexPath).row].address
        return cell
    }
}
