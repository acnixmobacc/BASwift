//
//  DisneyCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 5.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class DisneyCoordinator: Coordinator {

    // MARK: - Properties
    lazy var disneyCoordinator: UIStoryboard = {
        return UIStoryboard(name: AppStoryboard.disney.name, bundle: nil)
    }()

    func start() {
        firstViewControllerInCoordinator = showDisney()
    }

    @discardableResult
    func showDisney() -> DisneyTabViewController {
        let controller: DisneyTabViewController = instantiateDisneyStoryboardController()
        controller.coordinatorDelegate = self
        setDisneyTabViewControlllerDelegation(controller)

        navigationController.show(controller, sender: nil)
        return controller
    }

    fileprivate func setDisneyTabViewControlllerDelegation(_ controller: DisneyTabViewController) {
        for item in controller.childViewControllers {
            if let cartController = item as? CartViewController {
                cartController.coordinatorDelegate = self
            } else if let rentViewController = item as? RentViewController {
                rentViewController.coordinatorDelegate = self
            } else if let inventoryViewController = item as? InventoryViewController {
                inventoryViewController.coordinatorDelegate = self
            }
        }
    }

    private func instantiateDisneyStoryboardController<T: UIViewController>() -> T {
        return instantiateController(withStoryboard: disneyCoordinator)
    }
}

extension DisneyCoordinator: DisneyCoordinatorDelegate {
    func showProductDetail() {
        let controller: DisneyProductViewController = instantiateDisneyStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }

}
