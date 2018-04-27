//
//  CollectionSampleViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class SampleViewController: BaseViewController<SampleViewModel> {

    // MARK: - UI Fields
    @IBOutlet weak private var collectionView: UICollectionView!

    // MARK: - Properties
    var collectionAdapter: SampleCollectionViewAdapter!

    weak var coordinatorDelegate: CoordinatorDelegate?

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionAdapter = SampleCollectionViewAdapter(collectionView, data: [UISampleItem(), UISampleItem(),
                                                                               UISampleItem(), UISampleItem()])

    }
}
