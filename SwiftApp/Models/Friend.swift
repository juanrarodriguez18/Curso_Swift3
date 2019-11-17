//
//  Friend.swift
//  SwiftApp
//
//  Created by Juan Ramon Rodriguez Rosado on 17/11/2019.
//  Copyright © 2019 jrrodriguez. All rights reserved.
//

import Foundation

enum Gender: Int {
    case Male = 1
    case Female = 2
}

class Friend {
    var name: String?
    var lastName: String?
    var twitter: String?
    var gender: Gender?
    
    init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
    }
    
    convenience init() {
        self.init(name: "Nadie", lastName: "nadie")
    }
    
    var fullName: String {
        get {
            return "\(lastName!), \(name!)"
        }
    }
    
    class func fromDictionary(dictionary: NSDictionary) -> [Friend] {
        var friends = [Friend]()
        let list = dictionary["friends"] as? NSArray
        
        list?.enumerateObjects(options: NSEnumerationOptions.init(rawValue: 0), using: { (item, idx, stop) in
            let items = item as! NSDictionary
            let name = items["first_name"] as! String
            let lastName = items["last_name"] as! String
            let friend = Friend(name: name, lastName: lastName)
            friend.twitter = items["twitter"] as? String
            let friendGender = items["gender"] as? String
            
            if friendGender == "male" {
                friend.gender = Gender.Male
            }else{
                friend.gender = Gender.Female
            }
            
            friends.append(friend)
        })
        return friends
    }
}
