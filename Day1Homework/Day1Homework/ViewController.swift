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
            let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
            tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
            
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var contents = [Content]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshUI), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: UIApplication.willEnterForegroundNotification.rawValue), object: nil)
    }
    
    @objc func refreshUI() {
        getContentData()
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func getContentData() {
        contents.removeAll()
        for _ in 0...10 {
            let content = Content.create()
            self.contents.append(content)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        let content = contents[indexPath.row]
        cell.content = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

