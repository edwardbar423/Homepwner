//
//  ImageStore.swift
//  Homepwner
//
//  Created by Andrew Barber on 10/9/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import UIKit
import Foundation

class ImageStore : NSObject {
    
    var cache : NSCache<AnyObject, AnyObject>?
    
    override init() {
        super.init()
        
        self.cache = NSCache()
    }
    
    func setImage(_ image : UIImage, forKey key: String) {
        
        self.cache?.setObject(image, forKey: key as AnyObject)
        let imageURL = imageURLForKey(key)
        if let data = UIImageJPEGRepresentation(image, 0.5) {
        try? data.write(to: imageURL, options: [.atomic])
        }
    }
    
    func imageForKey(_ key : NSString) -> UIImage? {
        
        if let existingImage = cache?.object(forKey: key) as? UIImage {
            return existingImage
        } else {
            let imageURL = imageURLForKey(key as String)
            
            guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else {
                return nil
            }
            
            cache?.setObject(imageFromDisk, forKey: key)
            return imageFromDisk
            
        }
        
        
    }
    
    func deleteImageForKey(_ key : NSString) {
        
        self.cache?.removeObject(forKey: key)
        let imageURL = imageURLForKey(key as String)
        do {
            try FileManager.default.removeItem(at: imageURL)
        }
        catch let deleteError {
            print("Error removing the image from disk: \(deleteError)")
        }
    }
    
    func imageURLForKey(_ key: String) -> URL {
        
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        
        return documentDirectory.appendingPathComponent(key)
        
    }
    
}
