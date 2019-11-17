//
//  FriendsTableViewController.swift
//  SwiftApp
//
//  Created by Juan Ramon Rodriguez Rosado on 17/11/2019.
//  Copyright © 2019 jrrodriguez. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, NSURLConnectionDelegate, NSURLConnectionDataDelegate {
    
    lazy var serviceData = NSMutableData()
    var friends: [Friend]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        if friends == nil {
            requestFriends()
        }
    }
    
    func requestFriends() {
        let urlString = "http://gzfrancisco.name/resources/friends.json"
        
        let url = NSURL(string: urlString)
        let request = NSURLRequest(url: url! as URL)
        NSURLConnection(request: request as URLRequest, delegate: self)
    }
    
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        serviceData.append(data)
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        do {
            let json = try JSONSerialization.jsonObject(with: serviceData as Data, options: []) as! NSDictionary
            
            friends = Friend.fromDictionary(dictionary: json)
//            print(friends)
            
            tableView.reloadData()
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (friends == nil) ? 0 : friends!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell")
        let friend = friends![indexPath.row]
        cell?.textLabel?.text = friend.fullName
        cell?.detailTextLabel?.text = "@\(friend.twitter!)"
        
        if(friend.gender == Gender.Female){
            cell?.backgroundColor = UIColor(red: 0.99, green: 0.3, blue: 0.51, alpha: 1)
        }else{
            cell?.backgroundColor = UIColor(red: 0.82, green: 0.93, blue: 0.98, alpha: 1)
        }
        
        return cell!
    }
    
}
