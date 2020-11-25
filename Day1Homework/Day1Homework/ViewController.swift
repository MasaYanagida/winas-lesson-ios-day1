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
            initTableView()
            NotificationCenter.default.addObserver(self, selector: #selector(self.backGroundEvent),
                                                   name: UIApplication.willEnterForegroundNotification, object: nil)
        }
    }
    var contents = [Content]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    deinit {
        // TODO
        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: initView
extension ViewController {
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FetchTableViewCell", bundle: nil), forCellReuseIdentifier: "FetchTableViewCell")
    }
}

//MARK: Action
extension ViewController {
    @objc func backGroundEvent() {
        contents = []
        
        for _ in 1...10 {
            contents.append(Content.create())
        }
        
        tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 40
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FetchTableViewCell", for: indexPath) as? FetchTableViewCell else {fatalError()}
        cell.userName.text = contents[indexPath.row].name
        cell.userAddress.text = contents[indexPath.row].address
        return cell
    }
    
    
}
