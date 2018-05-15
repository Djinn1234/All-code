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
    let cellSubtitleID = "cellSubtitleID"
    
    let list = ["Name 01", "Name 02", "Name 03", "Name 04"]
    let detailList = ["00001", "00002", "00003", "00004"]
    

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

        cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellSubtitleID)
        cell?.selectionStyle = .none
        
        cell?.textLabel?.text = list[indexPath.row]
        cell?.detailTextLabel?.text = detailList[indexPath.row]
        
        return cell!
    }
    
}
