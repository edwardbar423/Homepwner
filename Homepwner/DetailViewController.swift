//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Andrew Barber on 10/8/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item : Item? {
        didSet {
            guard let item = item else { return }
            self.navigationItem.title = item.name
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let item = item else { return }
        guard let valueInDollarsInt = item.valueInDollars else { return }
        let valueInDollars = NSNumber(integerLiteral: valueInDollarsInt)
        
        self.nameField.text = item.name
        self.serialNumberField.text = item.serialNumber
        self.valueField.text = DetailViewController.valueFormatter.string(from: valueInDollars)
        self.dateLabel.text = DetailViewController.dateFormatter.string(from: item.dateCreated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let item = item else { return }
        guard let valueInDollarsInt = item.valueInDollars else { return }
        let valueInDollars = NSNumber(integerLiteral: valueInDollarsInt)
        
        self.nameField.text = item.name
        self.serialNumberField.text = item.serialNumber
        self.valueField.text = DetailViewController.valueFormatter.string(from: valueInDollars)
        
        self.view.endEditing(true)
        
    }
    
    static let valueFormatter: NumberFormatter = {
    
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
        
    }()
    
    static let dateFormatter : DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        
        return formatter
    }()
    
    //MARK : - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
        
    }
    
    
}



