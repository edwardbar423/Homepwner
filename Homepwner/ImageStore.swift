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
    
    func setImage(_ image : UIImage, forKey key: NSString) {
        
        self.cache?.setObject(image, forKey: key)
        
    }
    
    func imageForKey(_ key : NSString) -> UIImage? {
        
        return self.cache?.object(forKey: key) as? UIImage
        
    }
    
    func deleteImageForKey(_ key : NSString) {
        
        self.cache?.removeObject(forKey: key)
        
    }
    
}
