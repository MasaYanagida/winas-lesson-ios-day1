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
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        }
    }
    
    var contents = [Content]()

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
        navigationItem.title = "Address Book"
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshData), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: UIApplication.willEnterForegroundNotification.rawValue), object: nil)
    }
    
    @objc func refreshData() {
        for _ in 0...99 {
            self.contents.append(Content.create())
        }
        DispatchQueue.main.async {[weak self] in
            self?.tableView.reloadData()
        }
    }
}


// MARK: - TableView Data Source
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell()}
        cell.contents = contents[indexPath.row]
        return cell
    }
}


// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle Table View Selection
    }
}
