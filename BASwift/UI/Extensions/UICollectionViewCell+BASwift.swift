//
//  UICollectionViewCell+BASwift.swift
//  BASwift
//
//  Created by Burak Akkaya on 13.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    // MARK: - Static Methods
    static func registerSelf(_ collectionView: UICollectionView?) {
        let nib = UINib(nibName: self.className, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: self.className)
    }

    static func registerHeader(_ collectionView: UICollectionView?) {
        let nib = UINib(nibName: self.className, bundle: nil)
        collectionView?.register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: self.className)
    }

    static func registerFooter(_ collectionView: UICollectionView?) {
        let nib = UINib(nibName: self.className, bundle: nil)
        collectionView?.register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: self.className)
    }
}
