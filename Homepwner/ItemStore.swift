//
//  ItemStore.swift
//  Homepwner
//
//  Created by Andrew Barber on 10/4/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import Foundation

class ItemStore {
    
    var allItems = [Item]()
    
    init(allItems : [Item])  {
        
        self.allItems = allItems
        
        for _ in 0...5 {
            
            self.createItems()
            
        }
        
    }
    
    func createItems() -> Item {
        
        let newItem = Item.initWithRandomValues()
        
        allItems.append(newItem)
        
        return newItem
        
    }
    
    
}

