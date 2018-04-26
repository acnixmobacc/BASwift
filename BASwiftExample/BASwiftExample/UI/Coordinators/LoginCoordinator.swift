//
//  LoginCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 18.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate : class{
    func showRegister()
}

class LoginCoordinator : Coordinator{
    
    //MARK: - Properties
    lazy var loginStoryboard : UIStoryboard = {
        return UIStoryboard.init(name: "Login", bundle: nil)
    }()
    
    var rootNavigationController : UINavigationController
    
    var navigationController : UINavigationController!
    
    //MARK: - Initialization
    init(withNavigationController navigationController: UINavigationController) {
        self.rootNavigationController = navigationController
    }
    
    //MARK: - Public Methods
    func start(){
        showLogin()
    }
    
    //MARK: - Private Methods
    private func showLogin(){
        let controller : LoginViewController = instantiateLoginStoryboardController()
        controller.coordinatorDelegate = self
        self.navigationController =  UINavigationController(rootViewController: controller)
        rootNavigationController.present(navigationController, animated: true, completion: nil)
    }
    
    private func instantiateLoginStoryboardController<T : UIViewController>() -> T{
        return instantiateController(withStoryboard: loginStoryboard)
    }
}

//MARK: - Login Coordinator Delegate
extension LoginCoordinator : LoginCoordinatorDelegate{
    func showRegister() {
        let controller : FormViewController = instantiateLoginStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }
}
