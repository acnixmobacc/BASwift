//
//  Coordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol CoordinatorDelegate : class{
    func pop()
    func dismiss()
}

class Coordinator : NSObject{
    
    weak var appCoordinatorDelegate : AppCoordinatorDelegate?
    
    var navigationController : UINavigationController!
    
    //MARK: - Deinit
    deinit {
        Logger.debug("Deinit \(self)")
    }
    
    //MARK: - Initialization
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
        Logger.debug("Init \(self)")
    }
    
    func instantiateController<T : UIViewController>(withStoryboard storyboard:UIStoryboard) -> T{
        guard let controller = storyboard.instantiateViewController(withIdentifier: T.className) as? T else {
            fatalError("Cannot instantiate \(T.className)")
        }
        
        return controller
    }
}

extension Coordinator : CoordinatorDelegate{
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
        appCoordinatorDelegate?.onPop()
    }
}

extension Coordinator : UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Ensure the view controller is popping
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
                return
        }
        
        appCoordinatorDelegate?.onPop()
    }
    
    
}
