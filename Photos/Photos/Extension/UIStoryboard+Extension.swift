//
//  UIStoryboard+Extension.swift
//  Photos
//
//  Created by Joe on 13/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

fileprivate enum Storyboard : String {
    case main = "Main"
}

fileprivate extension UIStoryboard {
    
    static func loadFromMain(_ identifier: String) -> UIViewController {
        return load(from: .main, identifier: identifier)
    }
    
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

extension UIStoryboard {
    
    class func loadPhotosPagerViewController() -> PhotosPagerViewController? {
        return loadFromMain(Constants.SegueIdentifier.PhotosPager) as? PhotosPagerViewController
        
    }
    
    class func loadPhotosDetailViewController() -> PhotosDetailViewerController? {
        return loadFromMain(Constants.SegueIdentifier.PhotosDetail) as? PhotosDetailViewerController
        
    }
}
