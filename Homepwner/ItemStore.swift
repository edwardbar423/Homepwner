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
    var itemArchiveURL : NSURL?
    
    init() {
        let directories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = directories.first {
            itemArchiveURL = documentDirectory.appendingPathComponent("items.archive") as NSURL
        }
        
        if let path = self.itemArchiveURL?.path {
            NSKeyedUnarchiver.unarchiveObject(withFile: path)
        }
        
    }
    //MARK: Saving/Loading
    func saveChanges() -> Bool {
        
        print("Saving the store to \(self.itemArchiveURL)")
        
        if let itemArchiveURL = self.itemArchiveURL?.path {
            return NSKeyedArchiver.archiveRootObject(self.allItems, toFile: itemArchiveURL)
        }
        return true
    }
    
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

