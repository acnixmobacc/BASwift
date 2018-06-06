//
//  CollectionCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 27.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol CollectionCoordinatorDelegate: CoordinatorDelegate {
    @discardableResult
    func showCollection() -> UIViewController

    @discardableResult
    func showTable() -> UIViewController
}

class CollectionCoordinator: Coordinator {
    // MARK: - Properties
    lazy var adapterStoryboard: UIStoryboard = {
       return UIStoryboard(name: AppStoryboard.adapter.name, bundle: nil)
    }()

    // MARK: - Methods
    func start(withType type: DashboardItemType) {
        switch type {
        case .collection:
            firstViewControllerInCoordinator = showCollection()
        case .table:
            firstViewControllerInCoordinator = showTable()
        default:
            break
        }
    }

    // MARK: - Private Methods
    private func instantiateAdapterStoryboardController<T: UIViewController>() -> T {
        return instantiateController(withStoryboard: adapterStoryboard)
    }

}

extension CollectionCoordinator: CollectionCoordinatorDelegate {

    func showCollection() -> UIViewController {
        let controller: SampleViewController = instantiateAdapterStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
        return controller
    }

    func showTable() -> UIViewController {
        let controller: DetailViewController = instantiateAdapterStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
        return controller
    }
}
