//
//  CollectionSampleViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class SampleViewController: BABaseViewController<SampleViewModel> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionAdapter : SampleCollectionViewAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionAdapter = SampleCollectionViewAdapter(collectionView, data: [UISampleItem(), UISampleItem(),
                                                                               UISampleItem() , UISampleItem()])
        
    }
}

