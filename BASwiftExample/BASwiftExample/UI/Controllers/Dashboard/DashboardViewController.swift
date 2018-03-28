//
//  DashboardViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class DashboardViewController : BA_BaseViewController<DashboardViewModel>{

    lazy var menuItems : [UIDashboardItem] = {
        return [UIDashboardItem(withType: .progress), UIDashboardItem(withType: .picker),
                UIDashboardItem(withType: .collection), UIDashboardItem(withType: .table),
                UIDashboardItem(withType: .location)]
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionAdapter : DashboardCollectionAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDashboard()
    }

    private func setupDashboard(){
        collectionAdapter = DashboardCollectionAdapter(collectionView, data: menuItems)
        collectionAdapter?.delegate = self
    }
}

extension DashboardViewController : DashboardCollectionAdapterDelegate{    
    func onSelectItem(_ item: UIDashboardItem) {
    
        switch item.type {
        case .progress:
            performSegue(withIdentifier: "toProgress", sender: nil)
        case .collection:
            performSegue(withIdentifier: "toCollection", sender: nil)
        case .table:
            performSegue(withIdentifier: "toTable", sender: nil)
        case .picker:
            performSegue(withIdentifier: "toPicker", sender: nil)
        case .location:
            performSegue(withIdentifier: "toLocation", sender: nil)
        }
    }
}
