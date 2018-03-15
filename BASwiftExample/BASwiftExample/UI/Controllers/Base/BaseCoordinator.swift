//
//  BaseCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 4.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class Coordinator{
    deinit {
        print("deinit \(self)")
    }
}

class AppCoordinator{
    fileprivate let navigationController : UINavigationController
    fileprivate var childCoordinators = [Coordinator]()
    
    init(with navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("deinit \(self)")
    }
    
    func start(){
        showHome()
    }
    
    fileprivate func showHome(){
        let homeCoordinator = HomeCoordinator(with: navigationController)
        homeCoordinator.delegate = self
        homeCoordinator.start()
        childCoordinators.append(homeCoordinator)
    }
}

extension AppCoordinator :   HomeCoordinatorDelegate{
    func showProductDetail() {
        let detailCoordinator = DetailCoordinator.init(with: navigationController)
        detailCoordinator.start()
        childCoordinators.append(detailCoordinator)
    }
    
    
}
