//
//  UICollectionReusableCell+BASwift.swift
//  BASwift
//
//  Created by Burak Akkaya on 18.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UICollectionReusableView {
    // MARK: - Static Methods
    static func registerHeader(_ collectionView: UICollectionView?) {
        let nib = UINib(nibName: self.className, bundle: nil)
        collectionView?.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.className)
    }

    static func registerFooter(_ collectionView: UICollectionView?) {
        let nib = UINib(nibName: self.className, bundle: nil)
        collectionView?.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: self.className)
    }
}
