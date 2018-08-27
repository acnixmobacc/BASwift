//
//  AlertDisplayable.swift
//  BASwift
//
//  Created by Burak Akkaya on 26.08.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol AlertDisplayable: class {

    var alertView: AlertViewProtocol { get set }

    func showAlert(with message: String)

    func showAlert(with title: String, with message: String)

    func showAlert(with message: String, handler: ((Any) -> Void)?)

    func showAlert(with title: String, with message: String, handler: ((Any) -> Void)?)

    func showAlert(with alert: IAlert)

    func hideAlert()
}
