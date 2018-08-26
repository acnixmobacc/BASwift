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

//public extension AlertDisplayable where Self: BABaseViewController {
//    func showAlert(with message: String) {
//        alertView.show(vc: self, alert: BaseAlert(message: message))
//    }
//
//    func showAlert(with title: String, with message: String) {
//        alertView.show(vc: self, alert: BaseAlert(message: message, title: title))
//    }
//
//    func showAlert(with message: String, handler: ((Any) -> Void)?) {
//        alertView.show(vc: self, alert: BaseAlert(message: message, handler: handler))
//    }
//
//    func showAlert(with title: String, with message: String, handler: ((Any) -> Void)?) {
//        alertView.show(vc: self, alert: BaseAlert(message: message, title: title, handler: handler))
//    }
//
//    func showAlert(with alert: IAlert) {
//        alertView.show(vc: self, alert: alert)
//    }
//
//    func hideAlert() {
//        
//    }
//}
