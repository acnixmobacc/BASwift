//
//  DashboardViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class DashboardViewController: BaseViewController {

    weak var coordinatorDelegate: DashboardCoordinatorDelegate?

    lazy var menuItems: [UIDashboardItem] = {
        return [UIDashboardItem(withType: .progress), UIDashboardItem(withType: .picker),
                UIDashboardItem(withType: .collection), UIDashboardItem(withType: .table),
                UIDashboardItem(withType: .location), UIDashboardItem(withType: .login),
                UIDashboardItem(withType: .form), UIDashboardItem(withType: .customForm)]
    }()

    @IBOutlet weak private var collectionView: UICollectionView!

    var collectionAdapter: DashboardCollectionAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDashboard()
    }

    private func setupDashboard() {
        collectionAdapter = DashboardCollectionAdapter(collectionView, data: menuItems)
        collectionAdapter?.delegate = self
    }
}

extension DashboardViewController: DashboardCollectionAdapterDelegate {
    func onSelectItem(_ item: UIDashboardItem) {
        coordinatorDelegate?.perform(withType: item.type)
    }
}
