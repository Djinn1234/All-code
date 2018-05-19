//
//  ViewController.swift
//  All code
//
//  Created by Caleb Wells on 4/30/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellID = "cellID"
    
    let list = ["Coffee", "Raindrops", "Squirrel One", "Squirrel Two"]
    let detailList = ["Cups of coffee 20!", "Rainy day!", "Squirrels!", "Squirrels again!"]
    let imageList = ["coffee", "raindrop", "squirrel", "squirrel-2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Title"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        cell?.selectionStyle = .none
        
        cell?.imageView?.image = UIImage(named: imageList[indexPath.row])
        cell?.textLabel?.text = list[indexPath.row]
        cell?.detailTextLabel?.text = detailList[indexPath.row]
        cell?.accessoryType = .detailDisclosureButton
        
        return cell!
    }
    
}
