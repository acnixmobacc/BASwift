//
//  Coordinator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class Coordinator : NSObject{
    
    weak var appCoordinatorDelegate : AppCoordinatorDelegate?
    
    func instantiateController<T : UIViewController>(withStoryboard storyboard:UIStoryboard) -> T{
        guard let controller = storyboard.instantiateViewController(withIdentifier: T.className) as? T else {
            fatalError("Cannot instantiate \(T.className)")
        }
        
        return controller
    }
}
