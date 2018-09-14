//
//  PhotoCell.swift
//  Photos
//
//  Created by Joe on 13/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var photo : Photo?{
        didSet{
            self.imageView.image = photo?.image
            if let photo = self.photo{
                self.favoriteButton.isSelected = photo.favorite
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func favoriteButtonSelected(_ sender: UIButton) {
    
        if let photo = self.photo {
            photo.favorite = !photo.favorite
            sender.isSelected = !sender.isSelected
            CoreDataManager.shared.saveContext()
        }
    }
}
