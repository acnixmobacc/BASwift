//
//  UICollectionView+BASwift.swift
//  BASwift
//
//  Created by Burak Akkaya on 18.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UICollectionView {

    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Cannot dequeue cell with identifier \(T.className)")
        }

        return cell
    }

    func dequeueReusableView<T: UICollectionReusableView>(_ kind: String, _ indexPath: IndexPath) -> T {
        guard let headerView = self.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: T.className,
                                                                     for: indexPath) as? T else { fatalError("Cannot dequeue header") }

        return headerView
    }
}
