//
//  DependencyManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 21.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Swinject

open class BA_DependencyManager {

    public var container: Container

    public static let sharedInstance: BA_DependencyManager = {
        let instance = BA_DependencyManager()

        return instance
    }()

    private init() {
        container = BA_DependencyManager.default
    }

    fileprivate static let `default`: Container = {
        return Container {c in
            c.register(IProgressHUD.self) { _ in NVProgressHUD(withOptions: NVProgressOptions.nvProgressDefault) }
//            c.register(INavigationProvider.self) { _ in BaseNavigationProvider() }
//            c.register(IAlertManager.self) { _ in BaseAlertView() }
//            c.register(INavigationUtilities.self) { _ in BaseNavigationUtilities() }
        }
    }()

}
