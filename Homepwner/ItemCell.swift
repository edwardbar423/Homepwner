//
//  ItemCell.swift
//  Homepwner
//
//  Created by Andrew Barber on 10/7/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import UIKit
import Foundation

class ItemCell : UITableViewCell {

    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var serialNumberLabel : UILabel!
    @IBOutlet var valueLabel : UILabel!
    


    func updateLabels() {

        let bodyFont : UIFont = UIFont.preferredFont(forTextStyle: .body)
        self.nameLabel.font = bodyFont
        self.valueLabel.font = bodyFont
        
        let captionFont : UIFont = UIFont.preferredFont(forTextStyle: .caption1)
        self.serialNumberLabel.font = captionFont    
    }

}
