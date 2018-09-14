//
//  UICollectionView+Extension.swift
//  Photos
//
//  Created by Joe on 13/09/18.
//  Copyright © 2018 Jyothish. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerNibForCell(_ cellClass: UICollectionViewCell.Type) {
        let cellReuseIdentifier = cellClass.cellReuseIdentifier()
        register(UINib(nibName: cellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
    }
}
