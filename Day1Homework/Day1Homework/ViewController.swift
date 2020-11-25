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
            // TODO
        }
    }
    
    var contents = [Content]()

    override func viewDidLoad() {
        super.viewDidLoad()
        contents = getAddressData();
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    deinit {
        // TODO
    }
    
    func getAddressData() -> [Content] {
            
        var addressList: [Content] = []
        for _ in 0...10 {
            let address = Content.create()
            addressList.append(address)
        }
        return addressList
    }
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped");
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let content = contents[indexPath.row]
        cell.textLabel?.text = content.name;
        cell.detailTextLabel?.text = content.address;
        return cell
    }
}
