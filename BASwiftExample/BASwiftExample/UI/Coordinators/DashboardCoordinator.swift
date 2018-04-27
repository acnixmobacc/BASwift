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
}

class DashboardCoordinator: Coordinator {

    // MARK: - Properties
    lazy var mainStoryboard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: nil)
    }()

    // MARK: - Methods
    func start() {
        guard let controller = mainStoryboard.instantiateViewController(withIdentifier: DashboardViewController.className)
            as? DashboardViewController else {
                fatalError("Cannot instantiate dashboard view controller")
        }

        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }
}

// MARK: - Dashboard Coordinator Delegate
extension DashboardCoordinator: DashboardCoordinatorDelegate {
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
