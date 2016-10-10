//
//  Item.swift
//  Homepwner
//
//  Created by Andrew Barber on 10/4/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import Foundation


class Item : NSObject, NSCoding {
    
    static func initWithRandomValues() -> Item {
        
        let adjectives = ["Fluffy", "Rusty", "Shiny"]
        let nouns = ["Bear", "Spork", "Mac"]
        
        let adjective = adjectives[Int(arc4random_uniform(UInt32(adjectives.count)))]
        let noun = nouns[Int(arc4random_uniform(UInt32(nouns.count)))]
        
        let name : String = "\(adjective), \(noun)"
        
        let serial = (UUID().uuidString as NSString).substring(to: 5)
        let value = Int(arc4random_uniform(100))
        let itemKey = UUID().uuidString
        
        return Item(itemKey: itemKey, name: name, serialNumber: serial, valueInDollars: value, dateCreated: Date())
    }
    
    var itemKey : String?
    var name : String?
    var serialNumber : String?
    var valueInDollars : Int?
    var dateCreated : Date
    
    
    init(itemKey : String?, name : String? = "New Item", serialNumber : String? = "", valueInDollars : Int? = 0, dateCreated : Date = Date()) {
        
        self.itemKey = itemKey
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        self.dateCreated = dateCreated
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.dateCreated, forKey: "dateCreated")
        aCoder.encode(self.itemKey, forKey: "itemKey")
        aCoder.encode(self.serialNumber, forKey: "serialNumber")
        aCoder.encode(self.valueInDollars, forKey: "valueInDollars")
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        name = aDecoder.decodeObject(forKey: "name") as? String
        if let timeWizard = aDecoder.decodeObject(forKey: "dateCreated") as? Date {
            dateCreated = timeWizard
        }
        else {
            dateCreated = Date()
        }
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as? String
        serialNumber = aDecoder.decodeObject(forKey: "serialNumber") as? String
        valueInDollars = aDecoder.decodeObject(forKey: "valueInDollars") as? Int
        
    }
    
}


