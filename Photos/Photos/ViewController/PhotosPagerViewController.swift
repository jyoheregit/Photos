//
//  PhotosPagerViewController.swift
//  Photos
//
//  Created by Joe on 13/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import Foundation

import UIKit

class PhotosPagerViewController: UIPageViewController {
    
    var photos: [Photo] = []
    var indexOfCurrentPhoto: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.title = Constants.ViewControllerTitle.PhotosDetail
        
        if let photoViewerController = photoViewerController(with: photos[indexOfCurrentPhoto]) {
            setViewControllers([photoViewerController], direction: .forward, animated: false, completion: nil)
        }
    }
    
    func photoViewerController(with photo: Photo) -> PhotosDetailViewerController? {
       
        guard let photoViewerController = UIStoryboard.loadPhotosDetailViewController() else {
            fatalError("PhotosDetailViewController instantiation from Storyboard Failed")
        }
        
        photoViewerController.photo = photo
        return photoViewerController
    }
}

// MARK - UIPageViewControllerDataSource

extension PhotosPagerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController?{
        
        guard let photoVC = viewController as? PhotosDetailViewerController,
            let photo = photoVC.photo, let index = photos.index(of: photo) else { return nil }
        
        if index == photos.startIndex {
            return nil
        } else {
            let indexBefore = photos.index(before: index)
            let photo = photos[indexBefore]
            return photoViewerController(with: photo)
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
       
        guard let photoVC = viewController as? PhotosDetailViewerController,
            let photo = photoVC.photo, let index = photos.index(of: photo) else { return nil }
        
        if index == photos.index(before: photos.endIndex) {
            return nil
        } else {
            let indexAfter = photos.index(after: index)
            let photo = photos[indexAfter]
            return photoViewerController(with: photo)
        }
    }
}
