//
//  BaseProtocols.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

// MARK: - View Interface
public protocol BABaseViewProtocol: BABaseViewDelegate {

    var progressManager: ILoadable { get set}

    var alertManager: IAlertManager { get set}

    var contentManager: IContentManager { get set}

}

public protocol BABaseViewDelegate: class {

    func showProgress()

    func showAlert(_ alert: BaseAlert)

    func hideProgress()

    func showContentMessage(withMessage message: String, handler:(() -> Void)?)
}

public extension BABaseViewProtocol where Self: UIViewController {
    func showAlert(_ alert: BaseAlert) {
        alertManager.showAlert(withAlert: alert)
    }

    func showProgress() {
        progressManager.showLoading()
    }

    func hideProgress() {
        progressManager.hideLoading()
    }

    func showContentMessage(withMessage message: String, handler: (() -> Void)?) {
        contentManager.showMessage(withMessage: message, handler: { [unowned self] in
            self.contentManager.view.removeFromSuperview()
            if let handler = handler {
                handler()
            }
        })
        contentManager.view.frame = self.view.frame
        self.view.addSubview(contentManager.view)
    }
}

// MARK: - View Model Interface
public protocol BABaseViewModelProtocol: class {
    init()
}

// MARK: - Model Interface
public protocol BABaseModelProtocol: class {
    init()
}
