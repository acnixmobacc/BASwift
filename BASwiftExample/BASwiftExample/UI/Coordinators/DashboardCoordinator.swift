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
        return UIStoryboard(name: AppStoryboard.main.name, bundle: nil)
    }()

    // MARK: - Methods
    func start(withStartService service: Bool = false) {
        if service {
            firstViewControllerInCoordinator = showService()
        } else {
            firstViewControllerInCoordinator = showDashboard()
        }

    }

    @discardableResult
    func showService() -> BrandViewController {
        let controller: BrandViewController = instantiateMainStoryboardController()
        controller.coordinatorDelegate = self
        controller.viewModel = BrandViewModel()
        controller.viewModel.viewDelegate = controller
        navigationController.show(controller, sender: nil)
        return controller
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

    func perform(withType type: DashboardItemType) {
        switch type {
        case .progress:
            showProgress()
        case .login, .form, .customForm:
            showAuthScreen(type)
        case .picker:
            showPicker()
        case .table, .collection:
            showCollection(type)
        case .location:
            showLocation()
        case .disney:
            showDisney()
        }
    }
}

// MARK: - Private Methods
extension DashboardCoordinator {
    private func showDisney() {
        let disneyCoordinator = DisneyCoordinator(withNavigationController: self.navigationController,
                                                  appCoordinatorDelegate: appCoordinatorDelegate)
        appCoordinatorDelegate?.onPush(coordinator: disneyCoordinator)
        disneyCoordinator.start()
    }

    private func showCollection(_ type: DashboardItemType) {
        let collectionCoordinator = CollectionCoordinator(withNavigationController: self.navigationController,
                                                          appCoordinatorDelegate: appCoordinatorDelegate)
        appCoordinatorDelegate?.onPush(coordinator: collectionCoordinator)
        collectionCoordinator.start(withType: type)
    }

    private func showPicker() {
        let controller: PickerViewController = instantiateMainStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }

    private func showProgress() {
        let productCoordinator = ProductCoordinator(withNavigationController: self.navigationController,
                                                    appCoordinatorDelegate: appCoordinatorDelegate)
        appCoordinatorDelegate?.onPush(coordinator: productCoordinator)
        productCoordinator.appCoordinatorDelegate = self.appCoordinatorDelegate
        productCoordinator.start()

    }

    private func showAuthScreen(_ type: DashboardItemType) {
        let loginCoordinator = LoginCoordinator(withNavigationController: self.navigationController, appCoordinatorDelegate: appCoordinatorDelegate)
        appCoordinatorDelegate?.onPush(coordinator: loginCoordinator)
        loginCoordinator.start(withType: type)
    }

    private func showLocation() {
        let controller: LocationViewController = instantiateMainStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }

    private func instantiateMainStoryboardController<T: UIViewController>() -> T {
        return instantiateController(withStoryboard: mainStoryboard)
    }
}
