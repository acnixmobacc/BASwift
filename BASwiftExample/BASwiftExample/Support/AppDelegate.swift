//
//  AppDelegate.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 4.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AppConfigurator.config()

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController()

        guard let navigationController = self.window?.rootViewController as? UINavigationController else {
            fatalError("Root view controller not navigation controller")
        }
        self.appCoordinator = AppCoordinator(withNavigationController: navigationController)
        self.appCoordinator.start()

        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}
