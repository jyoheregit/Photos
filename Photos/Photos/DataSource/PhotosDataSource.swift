//
//  PhotosDataSource.swift
//  Photos
//
//  Created by Joe on 13/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PhotosDataSource: NSObject, UICollectionViewDataSource {
    
    private weak var collectionView: UICollectionView?
    private var fetchedResultsController: NSFetchedResultsController<Photo>
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.fetchedResultsController = CoreDataManager.shared.fetchedResultsController
        super.init()
        self.fetchPhotos()
        self.fetchedResultsController.delegate = self
    }
    
    func fetchPhotos() {
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            fatalError("Error in Fetching Photos")
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.cellReuseIdentifier(),
                                                                 for: indexPath) as? PhotoCell else{
            fatalError("Unexpected Index Path")
        }
        
        let photo = fetchedResultsController.object(at: indexPath)
        photoCell.photo = photo
        
        return photoCell
    }
}

extension PhotosDataSource: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        collectionView?.reloadData()
    }
}

extension PhotosDataSource {
    var photos: [Photo] {
        guard let objects = fetchedResultsController.sections?.first?.objects as? [Photo] else {
            return []
        }
        
        return objects
    }
}
