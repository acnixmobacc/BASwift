//
//  PullableCollectionViewAdapter.swift
//  BASwift
//
//  Created by Burak Akkaya on 27.08.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class PullableCollectionViewAdapter: CollectionViewAdapter {

    // MARK: - Properties
    public let refresher: UIRefreshControl
    weak var pullableDelegate: Pullable?

    // MARK: - Initialization
    public init(_ collectionView: UICollectionView, pullableDelegate: Pullable) {
        self.refresher = UIRefreshControl()
        super.init(collectionView)
        self.pullableDelegate = pullableDelegate
        setPullable()
    }

    // MARK: - Methods
    open func setPullable() {
        refresher.addTarget(self, action: #selector(pull), for: .valueChanged)
        collectionView.addSubview(refresher)
    }

    @objc
    open func pull() {
        pullableDelegate?.onPull()
    }
}
