//
//  ViewController.swift
//  UItableView Programmatic
//
//  Created by timofey makhlay on 11/8/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let cellId = "cellId"
    
    let twoDimetionalArray = [
        ["Nathan","Johnathan", "Micheal"],
        ["Zack","Tim","Medi","Ru"],
        ["Jeremy", "Tom"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimetionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimetionalArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
//        let name = indexPath.section == 0 ? names[indexPath.row] : cNames[indexPath.row]
        let name = twoDimetionalArray[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(name)     Section: \(indexPath.section) Row: \(indexPath.row)"
        
        // Adding an image
        var image : UIImage = #imageLiteral(resourceName: "Screen Shot 2018-11-08 at 1.04.35 PM")
        cell.imageView?.image = image
        
        
        // Standard options for accessories
        cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        cell.accessoryView?.backgroundColor = UIColor.blue
        return cell
    }

}

