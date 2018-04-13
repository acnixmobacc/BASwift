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

    init(withViewController viewController: UIViewController)

    func showAlert(withAlert alert: BaseAlert)
}

open class AlertViewManager: IAlertManager {
    // MARK: - Properties
    public var alertView: IAlertView = BADependencyManager.sharedInstance.container.resolve(IAlertView.self)!

    private var viewController: UIViewController?

    // MARK: - Initialization
    public required init(withViewController viewController: UIViewController) {
        self.viewController = viewController
    }

    // MARK: - Methods
    public func showAlert(withAlert alert: BaseAlert) {
        guard let viewController = self.viewController else {
            return
        }
        alertView.show(vc: viewController, alert: alert)
    }

}
