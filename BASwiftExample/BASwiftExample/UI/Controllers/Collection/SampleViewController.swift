//
//  CollectionSampleViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class SampleViewController: BA_BaseViewController<SampleViewModel> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionAdapter : SampleCollectionViewAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionAdapter = SampleCollectionViewAdapter(collectionView, data: [UISampleItem(), UISampleItem(),
                                                                               UISampleItem() , UISampleItem()])
        collectionAdapter.delegate = self
    }
}

extension SampleViewController : SampleCollectionViewDelegate{
    func onSelectItem() {
        performSegue(withIdentifier: "toPicker", sender: nil)
    }
}
