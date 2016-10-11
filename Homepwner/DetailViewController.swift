//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Andrew Barber on 10/8/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController, UINavigationControllerDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    //ImageView
    @IBOutlet var imageView: UIImageView!
    
    
    
    var item : Item? {
        didSet {
            guard let item = item else { return }
            self.navigationItem.title = item.name
        }
    }
    var imageStore : ImageStore?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let item = item else { return }
        guard let valueInDollarsInt = item.valueInDollars else { return }
            
        let valueInDollars = NSNumber(integerLiteral: valueInDollarsInt)
        
        self.nameField.text = item.name
        self.serialNumberField.text = item.serialNumber
        self.valueField.text = DetailViewController.valueFormatter.string(from: valueInDollars)
        self.dateLabel.text = DetailViewController.dateFormatter.string(from: item.dateCreated)
        
        if let key = item.itemKey {
            let imageToDisplay: UIImage? = self.imageStore?.imageForKey(key as NSString)
            self.imageView.image = imageToDisplay
        }
        
        
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

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image : UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return }
        guard let item : Item = self.item else {
            return }
        guard let itemKey = item.itemKey else {
            return }
        
        self.imageStore?.setImage(image, forKey: (itemKey as NSString) as String)
        self.imageView.image = image
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
        
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIBarButtonItem) {
        
        let ipc : UIImagePickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            ipc.sourceType = .camera
        } else {
            ipc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        }
        
        ipc.delegate = self
        self.present(ipc, animated: true, completion: nil)
    }
    
    
}



