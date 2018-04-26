//
//  DashboardCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol DashboardViewControllerDelegate : class{
    func perform(withType type:DashboardItemType)
}

class DashboardCoordinator : Coordinator{
    
    //MARK: - Properties
    lazy var mainStoryboard : UIStoryboard = {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }()
    
    var navigationController : UINavigationController
    
    
    //MARK: - Initialization
    init(withNavigationController navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Methods
    func start(){
        guard let controller = mainStoryboard.instantiateViewController(withIdentifier: DashboardViewController.className)
            as? DashboardViewController else{
                fatalError("Cannot instantiate dashboard view controller")
        }
        
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }
}

//MARK: - DashboardViewControllerDelegate
extension DashboardCoordinator : DashboardViewControllerDelegate{
    func perform(withType type: DashboardItemType) {
        switch type {
        case .progress:
            showProgress()
        case .login:
            showLogin()
        default:
            break
        }
    }
    
    func showProgress(){
        guard let controller = mainStoryboard.instantiateViewController(withIdentifier: MainViewController.className) as? MainViewController else{
            fatalError("Cannot instantiate main view controller")
        }
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }
    
    func showLogin(){
        let loginCoordinator = LoginCoordinator(withNavigationController: self.navigationController)
        appCoordinatorDelegate?.onPush(coordinator: loginCoordinator)
        loginCoordinator.appCoordinatorDelegate = self.appCoordinatorDelegate
        loginCoordinator.start()
        
    }
    
    func showRegister(){
        
    }
}
