//
//  ColorsViewController.swift
//  SwiftApp
//
//  Created by Juan Ramon Rodriguez Rosado on 12/10/2019.
//  Copyright © 2019 jrrodriguez. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController, CreateColorViewControllerDelegate, UITableViewDataSource {
    
    var names: [String]?
    var colors: [UIColor]?
    
    @IBOutlet weak var colorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        names = Array()
        colors = Array()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "CreateColor"{
            let createColorViewController = segue.destination as! CreateColorViewController
            createColorViewController.delegate = self
        }
    }
    
    func createColor(name: String, color: UIColor){
        names!.append(name)
        colors!.append(color)

        self.colorsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "CellId")
        }
        
        cell?.backgroundColor = colors![indexPath.row]
        cell?.textLabel?.text = names![indexPath.row]
        
        return cell!
    }
    
}
