//
//  HomeCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 4.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class HomeCoordinator : Coordinator{
    
    let navigationController:UINavigationController
    let homeViewController:HomeViewController
    
    init(with navigationController : UINavigationController) {
        self.navigationController = navigationController
        self.homeViewController = HomeViewController.init()
    }
    
    func start(){
        showHome()
    }
    
    fileprivate func showHome(){
        navigationController.show(homeViewController, sender: self)
    }
}
