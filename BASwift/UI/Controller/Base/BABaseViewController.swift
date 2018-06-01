//
//  BaseViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class BABaseViewController: UIViewController {

    // MARK: - Properties

    lazy open var progressManager: ILoadable = {[unowned self] in
        return ProgressHUDManager(forView: self.view)
    }()

    lazy open var alertManager: IAlertManager = {[unowned self] in
        return AlertViewManager(withViewController: self)
    }()

    lazy open var contentManager: IContentManager = {[unowned self] in
        return ContentManager(withView: MessageView.fromNib())
    }()
}

// MARK: - BA_BaseViewProtocol
extension BABaseViewController: BABaseViewProtocol {

    public func onUpdateView() {

    }

    public func showAlert(_ alert: BaseAlert) {
        alertManager.showAlert(withAlert: alert)
    }

    public func showProgress() {
        progressManager.showLoading()
    }

    public func hideProgress() {
        progressManager.hideLoading()
    }

    public func showContentMessage(withMessage message: String, handler: (() -> Void)?) {
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
