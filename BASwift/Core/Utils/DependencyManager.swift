//
//  DependencyManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 21.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Swinject

open class BA_DependencyManager {

    //MARK: - Static Variables
    public static let sharedInstance: BA_DependencyManager = {
        let instance = BA_DependencyManager()
        
        return instance
    }()
    
    //MARK: - Properties
    public var container: Container

    //MARK: - Initialization
    private init() {
        container = BA_DependencyManager.default
    }

    //MARK: - Default Container
    fileprivate static let `default`: Container = {
        return Container {c in
            c.register(IProgressHUD.self) { _ in NVProgressHUD(withOptions: NVProgressOptions.nvProgressDefault) }
            c.register(IAlertView.self) { _ in BaseAlertView() }
//            c.register(INavigationProvider.self) { _ in BaseNavigationProvider() }
//            c.register(INavigationUtilities.self) { _ in BaseNavigationUtilities() }
        }
    }()

}
