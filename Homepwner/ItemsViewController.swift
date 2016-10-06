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

    @IBAction func toggleEditingMode(_ sender: UIButton) {
    
        if self.isEditing {
        
        sender.setTitle("Edit", for: .normal)
        self.setEditing(false, animated: true)
        
        } else {
            
            sender.setTitle("Done", for: .normal)
            self.setEditing(true, animated: true)
        }
    
    }

    
    @IBAction func addNewItem(_ sender: AnyObject) {
        
        guard let itemStore = itemStore else {
            
            return
            
        }
        
        let newItem = itemStore.createItem()
        
        let itemIndex = (itemStore.allItems as NSArray).index(of: newItem)
        let indexPath = NSIndexPath(row: itemIndex, section: 0)
        
        
        
        self.tableView.insertRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight : CGFloat = UIApplication.shared.statusBarFrame.size.height
        let insets : UIEdgeInsets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0)
        
        self.tableView.contentInset = insets
        self.tableView.scrollIndicatorInsets = insets
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    // Move item in index
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        self.itemStore?.moveItemAtIndex(sourceIndexPath.row,
                                        newIndex : destinationIndexPath.row)
    }
    
//Data Source methods below!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  //Number of rows in a tableView
        
        
        if let itemStore = itemStore {
            
            return itemStore.allItems.count
            
        }
        else {
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //Tell which cell to go to.
        
        let cell : UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = self.itemStore?.allItems[indexPath.row]
        
        if let item = item, let valueInDollars = item.valueInDollars {
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(valueInDollars)"
        }
        
        return cell
        
    }
   
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            guard let itemStore = itemStore else {
                
                return
                
            }
            
            let item = itemStore.allItems[indexPath.row]
            
            var itemName = "No name found"
            
            if let name = item.name {
                itemName = name
            }
            let title = "Delete \(itemName)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
                self.itemStore!.removeItem(item)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
        })
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
    }
}



}












