//
//  Photo+Extension.swift
//  Photos
//
//  Created by Joe on 13/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit
import CoreData

extension Photo {
    
    var image: UIImage? {
        
        guard let data = self.imageData else {return nil}
        return UIImage(data: data)
    }
    
    static var entityName: String {
        return String(describing: Photo.self)
    }
    
    class func with(image: UIImage, in context: NSManagedObjectContext) -> Photo? {
        guard let photo = NSEntityDescription.insertNewObject(forEntityName: Photo.entityName, into: context) as? Photo else{
            return nil
        }
        
        photo.created = Date()
        photo.imageData = UIImageJPEGRepresentation(image, 1.0)
        photo.uuid = UUID().uuidString
        photo.favorite = false
        
        return photo
    }
    
}
