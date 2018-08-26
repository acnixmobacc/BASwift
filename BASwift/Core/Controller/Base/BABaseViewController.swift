//
//  BaseViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class BABaseViewController: UIViewController, BABaseViewProtocol {
    // MARK: - Properties
    lazy open var progressHUD: ProgressHUDProtocol = {
        return NVProgressHUD(withOptions: NVProgressHUDOptions.nvProgressDefault)
    }()

    lazy open var alertView: AlertViewProtocol = {
        return BaseAlertView()
    }()

    lazy open var errorView: UIView & ErrorViewProtocol = {
        let bundle = Bundle(for: BAErrorView.self)
        return BAErrorView.fromNib(bundle: bundle)
    }()

    // MARK: - AlertDisplayable
    open func showAlert(with message: String) {
        alertView.show(vc: self, alert: BaseAlert(message: message))
    }

    open func showAlert(with title: String, with message: String) {
        alertView.show(vc: self, alert: BaseAlert(message: message, title: title))
    }

    open func showAlert(with message: String, handler: ((Any) -> Void)?) {
        alertView.show(vc: self, alert: BaseAlert(message: message, handler: handler))
    }

    open func showAlert(with title: String, with message: String, handler: ((Any) -> Void)?) {
        alertView.show(vc: self, alert: BaseAlert(message: message, title: title, handler: handler))
    }

    open func showAlert(with alert: IAlert) {
        alertView.show(vc: self, alert: alert)
    }

    open func hideAlert() {

    }

    // MARK: - ErrorDisplayable
    open func showError(with message: String, frame: CGRect? = nil, retry: (() -> Void)?) {

        errorView.show(with: message)
        errorView.handler = retry

        guard let contentViewFrame = frame else {
            errorView.frame = self.view.bounds
            self.view.addSubview(errorView)
            return
        }

        errorView.frame = contentViewFrame
        self.view.addSubview(errorView)

    }

    open func hideError() {
        errorView.removeFromSuperview()
    }

    // MARK: - Loadable
    open func showProgress() {
        progressHUD.show(in: self.view)
    }

    open func hideProgress() {
        progressHUD.hide()
    }
}
