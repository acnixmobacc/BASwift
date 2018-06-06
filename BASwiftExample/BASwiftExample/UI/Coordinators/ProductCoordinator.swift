//
//  ProductCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 7.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol ProductCoordinatorDelegate: CoordinatorDelegate {
    func showService()
}

class ProductCoordinator: Coordinator {

    // MARK: - Properties
    lazy var productStoryboard: UIStoryboard = {
        return UIStoryboard(name: AppStoryboard.product.name, bundle: nil)
    }()

    func start() {
        firstViewControllerInCoordinator = showMain()
    }

    @discardableResult
    func showMain() -> MainViewController {
        let controller: MainViewController = instantiateMainStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
        return controller
    }

    private func instantiateMainStoryboardController<T: UIViewController>() -> T {
        return instantiateController(withStoryboard: productStoryboard)
    }

}

extension ProductCoordinator: ProductCoordinatorDelegate {
    func showService() {
        let dashboardCoordinator = DashboardCoordinator(withNavigationController: self.navigationController)
        appCoordinatorDelegate?.onPush(coordinator: dashboardCoordinator)
        dashboardCoordinator.appCoordinatorDelegate = self.appCoordinatorDelegate
        dashboardCoordinator.start(withStartService: true)
    }
}
