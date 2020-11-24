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
            createAddressData() {
                DispatchQueue.main.async {[unowned self] in
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    var contents = [Content]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    deinit {
        // TODO
    }
}

// MARK:- Configuration
extension ViewController {
    
    private func initView() {
        setupNavBar()
        configureTableView()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Address Book"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    private func createAddressData(onCompleted: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {[unowned self] in
            for _ in 0...99 {
                self.contents.append(Content.create())
            }
            onCompleted()
        }
    }
}

// MARK: - TableView Data Source
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count > 0 ? contents.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell()}
        if contents.count > 0 {
            cell.contents = contents[indexPath.row]
        }
        return cell
    }
}


// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle Table View Selection
    }
}
