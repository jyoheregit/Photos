//
//  PhotosViewController.swift
//  Photos
//
//  Created by Joe on 13/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PhotosViewController : UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var dataSource: PhotosDataSource = {
        return PhotosDataSource(collectionView: collectionView)
    }()
    
    lazy var photoPickerManager: PhotoPickerManager = {
        let manager = PhotoPickerManager(presentingViewController: self)
        manager.delegate = self
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        collectionView.registerNibForCell(PhotoCell.self)
    }
    
    @IBAction func addPhoto(_ sender: UIBarButtonItem) {
        
        photoPickerManager.presentPhotoPicker(animated: true)
    }
}

// MARK - PhotoPickerManagerDelegate

extension PhotosViewController: PhotoPickerManagerDelegate {
    
    func manager(_ manager: PhotoPickerManager, didPickImage image: UIImage) {
        let _ = Photo.with(image: image, in: CoreDataManager.shared.managedObjectContext())
        CoreDataManager.shared.saveContext()
        manager.dismissPhotoPicker(animated: true, completion:nil)
    }
}

// MARK - UICollectionViewDelegate

extension PhotosViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            guard let pagerViewController = UIStoryboard.loadPhotosPagerViewController() else {
                fatalError("PhotosPagerViewController instantiation from Storyboard Failed")
            }
            pagerViewController.photos = dataSource.photos
            pagerViewController.indexOfCurrentPhoto = indexPath.row
            self.navigationController?.pushViewController(pagerViewController, animated: true)
    }
}
