//
//  DependencyManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 21.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Swinject

open class BADependencyManager {

    // MARK: - Static Variables
    public static let sharedInstance: BADependencyManager = {
        let instance = BADependencyManager()

        return instance
    }()

    // MARK: - Properties
    public var container: Container

    // MARK: - Initialization
    private init() {
        container = BADependencyManager.default
    }

    // MARK: - Default Container
    fileprivate static let `default`: Container = {
        return Container {c in
            c.register(IProgressHUD.self) { _ in NVProgressHUD(withOptions: NVProgressOptions.nvProgressDefault) }
            c.register(IAlertView.self) { _ in BaseAlertView() }
//            c.register(INavigationProvider.self) { _ in BaseNavigationProvider() }
//            c.register(INavigationUtilities.self) { _ in BaseNavigationUtilities() }
        }
    }()

}
