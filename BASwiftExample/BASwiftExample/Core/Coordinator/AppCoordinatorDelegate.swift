//
//  AppCoordinatorDelegate.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 17.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol AppCoordinatorDelegate: class {
    func onPop()

    func onPush(coordinator: Coordinator)

    func startDisneyCoordinator(navigationController: UINavigationController)

    func startCollectionCoordinator(navigationController: UINavigationController, type: DashboardItemType)

    func startProductCoordinator(navigationController: UINavigationController)

    func startAuthCoordinator(navigationController: UINavigationController, type: DashboardItemType)

    func startDashboardCoordinator(navigationController: UINavigationController)
}
