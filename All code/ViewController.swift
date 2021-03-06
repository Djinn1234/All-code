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
    
    var list = ["Coffee", "Raindrops", "Squirrel One", "Squirrel Two"]
    var detailList = ["Cups of coffee 20!", "Rainy day!", "Squirrels!", "Squirrels again!"]
    var imageList = ["coffee", "raindrop", "squirrel", "squirrel-2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Title"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    // Uncomment this block of code to achieve alternating cell colors.
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row % 2 == 0 {
//            let altCellColor: UIColor? = UIColor(white: 0.7, alpha: 0.5)
//            cell.backgroundColor = altCellColor
//        }
//    }

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
        
        
        let switchObj = UISwitch(frame: CGRect(x: 1, y: 1, width: 20, height: 20))
        switchObj.isOn = false
        switchObj.addTarget(self, action: #selector(toggel(_:)), for: .valueChanged)
        cell?.accessoryView = switchObj
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.list.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let newVC = NewViewController()
//        navigationController?.pushViewController(newVC, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        print(cell?.detailTextLabel?.text ?? "")
        
    }
    
    @objc func toggel(_ sender: UISwitch) {
        print("Switch!!")
    }
    
}











