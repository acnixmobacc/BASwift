//
//  AlertViewManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol IAlertManager {
    var alertView: IAlertView { get set }

    init(alertView: IAlertView, with viewController: UIViewController)

    func showAlert(withAlert alert: IAlert)
}

open class AlertViewManager: IAlertManager {
    // MARK: - Properties
    public var alertView: IAlertView

    private var viewController: UIViewController?

    // MARK: - Initialization
    public required init(alertView: IAlertView, with viewController: UIViewController) {
        self.viewController = viewController
        self.alertView = alertView
    }

    // MARK: - Methods
    public func showAlert(withAlert alert: IAlert) {
        guard let viewController = self.viewController else {
            return
        }
        alertView.show(vc: viewController, alert: alert)
    }

}
