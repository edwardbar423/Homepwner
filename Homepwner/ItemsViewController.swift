//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Andrew Barber on 10/4/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore : ItemStore?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let firstItem = Item()
        let secondItem = Item(name: "Sia", serialNumber: "OMG", valueInDollars: 1555, dateCreated: Date())
        let myNewItem = Item.initWithRandomValues()
        
        let statusBarHeight : CGFloat = UIApplication.shared.statusBarFrame.size.height
        let insets : UIEdgeInsets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0)
        
        self.tableView.contentInset = insets
        self.tableView.scrollIndicatorInsets = insets
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if let itemStore = itemStore {
            
            return itemStore.allItems.count
            
        }
        else {
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = self.itemStore?.allItems[indexPath.row]
        
        if let item = item, let valueInDollars = item.valueInDollars {
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(valueInDollars)"
        }
        
        
        
        
        return cell
        
    }
    
}

