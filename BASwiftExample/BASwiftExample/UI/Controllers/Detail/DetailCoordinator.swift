//
//  DetailCoordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 14.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit



class DetailCoordinator : Coordinator{
    
    let navigationController:UINavigationController
    let productViewController:ProductViewController
    
    init(with navigationController : UINavigationController) {
        self.navigationController = navigationController
        self.productViewController = ProductViewController.init()
    }
    
    func start(){
        showDetail()
    }
    
    fileprivate func showDetail(){
        navigationController.show(productViewController, sender: self)
    }
}
