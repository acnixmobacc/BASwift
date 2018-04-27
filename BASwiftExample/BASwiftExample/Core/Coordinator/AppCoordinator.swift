//
//  AppCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit
import BASwift

class AppCoordinator : NSObject{
    
    // MARK: - Properties
    var navigationController : UINavigationController
    
    var childCoordinators : BASStack<Coordinator>
    
    // MARK: - Initialization
    init(withNavigationController navigationController:UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = BASStack<Coordinator>()
    }
    
    //MARK: - Methods
    func start(){
        showDashboard()
    }
    
    //MARK: - Private Methods
    private func showDashboard(){
        let dashboardCoordinator = DashboardCoordinator(withNavigationController: navigationController)
        dashboardCoordinator.appCoordinatorDelegate = self
        dashboardCoordinator.start()
        childCoordinators.push(dashboardCoordinator)
    }
}

//MARK: - AppCoordinator Delegate
extension AppCoordinator : AppCoordinatorDelegate{
    
    func onPop() {
        let coordinator = childCoordinators.pop()
        Logger.debug("Popped \(coordinator!)")
    }
    
    func onPush(coordinator: Coordinator) {
        childCoordinators.push(coordinator)
        Logger.debug("Pushed \(coordinator)")
    }
    
    
}
