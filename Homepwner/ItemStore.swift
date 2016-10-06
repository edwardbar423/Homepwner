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
    
    func createItem() -> Item {
        
        let newItem = Item.initWithRandomValues()
        
        allItems.append(newItem)
        
        return newItem
        
    }
    
    func removeItem(_ item: Item) {
        
        let itemIndex = (allItems as NSArray).index(of: item)
        allItems.remove(at: itemIndex)
        
    }
    
    func moveItemAtIndex(_ oldIndex : Int,
                         newIndex : Int) {
        if oldIndex == newIndex {
            return
        }
        
        let movedItem = allItems[oldIndex]
        allItems.remove(at: oldIndex)
        allItems.insert(movedItem, at: newIndex)
        
        
    }
    
}

