//
//  BaseProtocols.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

// MARK: - View Interface
public protocol BABaseViewProtocol: class {

    func onUpdateView()

    func showProgress()

    func showAlert(_ alert: BaseAlert)

    func hideProgress()

    func showContentMessage(withMessage message: String, handler:(() -> Void)?)
}

// MARK: - View Model Interface
public protocol BABaseViewModelProtocol: class {

    init()
}

// MARK: - Model Interface
public protocol BABaseModelProtocol: class {

    init()
}
