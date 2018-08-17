//
//  Coordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import UIKit

protocol CoordinatorDelegate: class {
    func pop()
    func dismiss()
}

// MARK: - Coordinator
class Coordinator: NSObject {

    // MARK: - Properties
    weak var appCoordinatorDelegate: AppCoordinatorDelegate?

    var navigationController: UINavigationController!

    var firstViewControllerInCoordinator: UIViewController!

    // MARK: - Deinit
    deinit {
        Logger.debug("Deinit \(self)")
    }

    // MARK: - Initialization
    init(withNavigationController navigationController: UINavigationController, appCoordinatorDelegate: AppCoordinatorDelegate?) {
        self.navigationController = navigationController
        super.init()
        self.appCoordinatorDelegate = appCoordinatorDelegate
        Logger.debug("Init \(self)")
    }

    // MARK: - Helper Method
    func instantiateController<T: UIViewController>(withStoryboard storyboard: UIStoryboard) -> T {
        guard let controller = storyboard.instantiateViewController(withIdentifier: T.className) as? T else {
            fatalError("Cannot instantiate \(T.className)")
        }

        return controller
    }
}

// MARK: - Coordinator Delegate
extension Coordinator: CoordinatorDelegate {
    func pop() {
        navigationController.popViewController(animated: true)
    }

    @objc
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
        appCoordinatorDelegate?.onPop()
    }
}
