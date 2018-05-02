//
//  LoginCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 18.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate: CoordinatorDelegate {
    @discardableResult
    func showRegister() -> UIViewController
}

class LoginCoordinator: Coordinator {

    // MARK: - Properties
    lazy var loginStoryboard: UIStoryboard = {
        return UIStoryboard(name: "Login", bundle: nil)
    }()

    var loginNavigation: UINavigationController!

    // MARK: - Public Methods
    func start() {
        firstViewControllerInCoordinator = showLogin()
    }

    // MARK: - Private Methods
    @discardableResult
    private func showLogin() -> UIViewController {
        let controller: LoginViewController = instantiateLoginStoryboardController()
        controller.coordinatorDelegate = self
        loginNavigation = UINavigationController(rootViewController: controller)
        navigationController.show(loginNavigation, sender: nil)
        return controller
    }

    private func instantiateLoginStoryboardController<T: UIViewController>() -> T {
        return instantiateController(withStoryboard: loginStoryboard)
    }
}

// MARK: - Login Coordinator Delegate
extension LoginCoordinator: LoginCoordinatorDelegate {
    func showRegister() -> UIViewController {
        let controller: FormViewController = instantiateLoginStoryboardController()
        controller.coordinatorDelegate = self
        loginNavigation.show(controller, sender: nil)
        return controller
    }
}
