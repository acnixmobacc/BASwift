//
//  DashboardCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol DashboardCoordinatorDelegate: CoordinatorDelegate {
    func perform(withType type: DashboardItemType)
    func showService()
}

class DashboardCoordinator: Coordinator {

    // MARK: - Properties
    lazy var mainStoryboard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: nil)
    }()

    // MARK: - Methods
    func start() {
        firstViewControllerInCoordinator = showDashboard()
    }

    @discardableResult
    func showDashboard() -> UIViewController {
        let controller: DashboardViewController = instantiateMainStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
        return controller
    }
}

// MARK: - Dashboard Coordinator Delegate
extension DashboardCoordinator: DashboardCoordinatorDelegate {
    func showService() {
        let controller: ServiceViewController = instantiateMainStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }

    func perform(withType type: DashboardItemType) {
        switch type {
        case .progress:
            showProgress()
        case .login:
            showLogin()
        case .picker:
            showPicker()
        case .table, .collection:
            showCollection(type)
        default:
            break
        }
    }

    private func showCollection(_ type: DashboardItemType) {
        let collectionCoordinator = CollectionCoordinator(withNavigationController: self.navigationController)
        appCoordinatorDelegate?.onPush(coordinator: collectionCoordinator)
        collectionCoordinator.appCoordinatorDelegate = self.appCoordinatorDelegate
        collectionCoordinator.start(withType: type)
    }

    private func showPicker() {
        let controller: PickerViewController = instantiateMainStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }

    private func showProgress() {
        let controller: MainViewController = instantiateMainStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }

    private func showLogin() {
        let loginCoordinator = LoginCoordinator(withNavigationController: self.navigationController)
        appCoordinatorDelegate?.onPush(coordinator: loginCoordinator)
        loginCoordinator.appCoordinatorDelegate = self.appCoordinatorDelegate
        loginCoordinator.start()
    }

    private func showRegister() {

    }

    private func instantiateMainStoryboardController<T: UIViewController>() -> T {
        return instantiateController(withStoryboard: mainStoryboard)
    }
}
