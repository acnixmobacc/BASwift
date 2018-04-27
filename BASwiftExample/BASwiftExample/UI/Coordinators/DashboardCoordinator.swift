//
//  DashboardCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol DashboardCoordinatorDelegate : CoordinatorDelegate{
    func perform(withType type:DashboardItemType)
}

class DashboardCoordinator : Coordinator{
    
    //MARK: - Properties
    lazy var mainStoryboard : UIStoryboard = {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }()
    
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

//MARK: - Dashboard Coordinator Delegate
extension DashboardCoordinator : DashboardCoordinatorDelegate{
    func perform(withType type: DashboardItemType) {
        switch type {
        case .progress:
            showProgress()
        case .login:
            showLogin()
        case .picker:
            showPicker()
        default:
            break
        }
    }
    
    func showPicker(){
        let controller : PickerViewController = instantiateMainStoryboardController()
        controller.coordinatorDelegate = self
        navigationController.show(controller, sender: nil)
    }
    
    func showProgress(){
        let controller : MainViewController = instantiateMainStoryboardController()
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
    
    private func instantiateMainStoryboardController<T : UIViewController>() -> T{
        return instantiateController(withStoryboard: mainStoryboard)
    }
}
