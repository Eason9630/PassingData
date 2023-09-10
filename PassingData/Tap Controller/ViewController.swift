//
//  ViewController.swift
//  PassingData
//
//  Created by 林祔利 on 2023/9/9.
//

import UIKit
/*
 -- Custom init
 -- Completion Header (Closure)
 -- NotificationCenter post
 */

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var observer: NSObjectProtocol?
    
    private let data = [
        ["apple","sony","google","microsoft"],
        ["one","two","three","four"],
        ["UK","Italy","Canada","USA"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        
        observer = NotificationCenter.default.addObserver(forName: Notification.Name("ourCustom"), object: nil, queue: .main, using: { notification in
            guard let object = notification.object as? [String: UIColor] else {
                return
            }
            guard let color = object["color"] else {
                return
            }
            
            self.view.backgroundColor = color
            self.table.isHidden = true
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let items = data[indexPath.section]
        let vc = SecondCustomViewController(selectedItem: items[indexPath.row], relatedItems: items)
        
        
        
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    

}

