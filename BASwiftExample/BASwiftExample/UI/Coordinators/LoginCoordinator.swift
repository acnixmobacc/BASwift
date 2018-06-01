//
//  LoginCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 18.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

// MARK: - Login Coordinator Delegate
protocol LoginCoordinatorDelegate: CoordinatorDelegate {
    @discardableResult
    func showRegister() -> UIViewController
}

// MARK: - Login Coordinator
class LoginCoordinator: Coordinator {

    // MARK: - Properties
    lazy var loginStoryboard: UIStoryboard = {
        return UIStoryboard(name: "Login", bundle: nil)
    }()

    var loginNavigation: UINavigationController!

    // MARK: - Public Methods
    func start(withType type: DashboardItemType) {
        switch type {
        case .login:
            firstViewControllerInCoordinator = presentLogin()
        case .form:
            firstViewControllerInCoordinator = presentRegister()
        case .customForm:
            firstViewControllerInCoordinator = presentCustomForm()
        default:
            break
        }
    }
}

// MARK: - Login Coordinator Delegate
extension LoginCoordinator: LoginCoordinatorDelegate {
    func showRegister() -> UIViewController {
        let controller = createFormViewController()
        loginNavigation.show(controller, sender: nil)
        return controller
    }
}

// MARK: - Private Methods
extension LoginCoordinator {

    @discardableResult
    private func presentLogin() -> UIViewController {
        let controller: LoginViewController = instantiateLoginStoryboardController()
        controller.viewModel = LoginViewModel()
        controller.viewModel.view = controller
        controller.coordinatorDelegate = self
        start(withRootController: controller)
        return controller
    }

    @discardableResult
    private func presentCustomForm() -> UIViewController {
        let controller: CustomFormViewController = instantiateLoginStoryboardController()
        controller.coordinatorDelegate = self
        start(withRootController: controller)
        return controller
    }

    @discardableResult
    private func presentRegister() -> UIViewController {
        let controller = createFormViewController()
        start(withRootController: controller)
        return controller
    }

    private func createFormViewController() -> FormViewController {
        let controller: FormViewController = instantiateLoginStoryboardController()
        controller.viewModel = FormViewModel()
        controller.viewModel.view = controller
        controller.coordinatorDelegate = self
        return controller
    }

    private func start(withRootController controller: UIViewController) {
        loginNavigation = UINavigationController(rootViewController: controller)
        let barButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismiss))
        controller.navigationItem.setLeftBarButtonItems([barButton], animated: true)
        navigationController.show(loginNavigation, sender: nil)
    }

    private func instantiateLoginStoryboardController<T: UIViewController>() -> T {
        return instantiateController(withStoryboard: loginStoryboard)
    }
}
