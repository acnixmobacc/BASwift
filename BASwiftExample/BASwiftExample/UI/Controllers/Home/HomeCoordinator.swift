//
//  HomeCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 4.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol HomeCoordinatorDelegate : class{
    func showProductDetail()
}


class HomeCoordinator : Coordinator {
    
    weak var delegate:HomeCoordinatorDelegate?
    
    let navigationController:UINavigationController
    var mainViewController:MainViewController
    
    init(with navigationController : UINavigationController) {
        self.navigationController = navigationController
        self.mainViewController = MainViewController.init()
        super.init()
        self.mainViewController.routerDelegate = self
    }
    
    func start(){
        showHome()
    }
    
    fileprivate func showHome(){
        navigationController.show(mainViewController, sender: self)
    }
}

extension HomeCoordinator : MainRouterDelegate{
    func showProductDetail() {
        delegate?.showProductDetail()
    }
    
    
}


