//
//  BaseProtocols.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

// MARK: - View Interface
public protocol BABaseViewProtocol: BABaseViewDelegate, Loadable {

    var alertManager: IAlertManager { get set }

    var errorViewManager: ErrorViewManagerProtocol { get set }

}

public protocol BABaseViewDelegate: class {

    func showProgress()

    func showAlert(_ alert: BaseAlert)

    func hideProgress()
}

public extension BABaseViewProtocol where Self: UIViewController {
    func showAlert(_ alert: BaseAlert) {
        alertManager.showAlert(withAlert: alert)
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
