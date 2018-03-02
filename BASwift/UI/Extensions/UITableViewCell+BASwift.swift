//
//  UITableViewCell+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 25/03/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    static func registerSelf(_ toTableView: UITableView?) {
        let nib = UINib(nibName: self.className, bundle: nil)
        toTableView?.register(nib, forCellReuseIdentifier: self.className)
    }

}

public extension UICollectionViewCell {
    static func registerSelf(_ collectionView: UICollectionView?) {
        let nib = UINib(nibName: self.className, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: self.className)
    }

}
