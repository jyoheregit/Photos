//
//  PhotosDetailViewController.swift
//  Photos
//
//  Created by Joe on 13/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import Foundation
import UIKit

class PhotosDetailViewerController: UIViewController {
    
    @IBOutlet var photoImageView: UIImageView!
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photo = photo {
            photoImageView.image = photo.image
        }
    }
}
