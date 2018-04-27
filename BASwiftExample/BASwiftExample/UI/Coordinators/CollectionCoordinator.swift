//
//  CollectionCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 27.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class CollectionCoordinator: Coordinator {
    // MARK: - Properties
    lazy var adapterStoryboard: UIStoryboard = {
       return UIStoryboard(name: "Adapter", bundle: nil)
    }()

    // MARK: - Methods
    func start(withType type: DashboardItemType) {
        switch type {
        case .collection:
            showCollection()
        case .table:
            showTable()
        default:
            break
        }
    }

    // MARK: - Private Methods
    private func showTable() {
        let controller: DetailViewController = instantiateAdapterStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }

    private func showCollection() {
        let controller: SampleViewController = instantiateAdapterStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }

    private func instantiateAdapterStoryboardController<T: UIViewController>() -> T {
        return instantiateController(withStoryboard: adapterStoryboard)
    }

}
