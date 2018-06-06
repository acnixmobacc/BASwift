//
//  AppCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import UIKit

class AppCoordinator: NSObject {

    // MARK: - Properties
    var navigationController: UINavigationController

    var childCoordinators: BASStack<Coordinator>

    // MARK: - Initialization
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = BASStack<Coordinator>()
        super.init()
        self.navigationController.delegate = self
    }

    // MARK: - Methods
    func start() {
        showDashboard()
    }

    // MARK: - Private Methods
    private func showDashboard() {
        let dashboardCoordinator = DashboardCoordinator(withNavigationController: navigationController, appCoordinatorDelegate: self)
        dashboardCoordinator.start()
        childCoordinators.push(dashboardCoordinator)
    }
}

// MARK: - AppCoordinator Delegate
extension AppCoordinator: AppCoordinatorDelegate {

    func onPop() {
        let coordinator = childCoordinators.pop()
        Logger.debug("Popped \(coordinator!)")
    }

    func onPush(coordinator: Coordinator) {
        childCoordinators.push(coordinator)
        Logger.debug("Pushed \(coordinator)")
    }

}

// MARK: - UINavigationController Delegate
extension AppCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Ensure the view controller is popping
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
                return
        }

        guard let coordinator = childCoordinators.peek(),
            coordinator.firstViewControllerInCoordinator == poppedViewController else {
            return
        }

        onPop()
    }

}
