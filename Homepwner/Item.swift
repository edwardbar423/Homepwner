//
//  Item.swift
//  Homepwner
//
//  Created by Andrew Barber on 10/4/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import Foundation


class Item {
    
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
    
    let itemKey : String?
    let name : String?
    let serialNumber : String?
    let valueInDollars : Int?
    let dateCreated : Date
    
    
    init(itemKey : String?, name : String? = "New Item", serialNumber : String? = "", valueInDollars : Int? = 0, dateCreated : Date = Date()) {
        
        self.itemKey = itemKey
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        self.dateCreated = dateCreated
    }
    
    
}


