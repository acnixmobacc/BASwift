//
//  BaseViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class BABaseViewController<T: BA_BaseViewModelProtocol> : UIViewController {

    // MARK: - Properties
    public var viewModel: T = T()

    lazy open var progressManager: ILoadable = {[unowned self] in
        return ProgressHUDManager(forView: self.view)
    }()

    lazy open var alertManager: IAlertManager = {[unowned self] in
        return AlertViewManager(withViewController: self)
    }()

    lazy open var contentManager: IContentManager = {[unowned self] in
        return ContentManager(withView: MessageView.fromNib())
    }()

    // MARK: View Controller Lifecycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.onWillAppear()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.onDidAppear()
    }

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewModel.onWillLayoutSubviews()
    }

    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.onDidLayoutSubviews()
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.onWillDisappear()
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.onDidDisappear()
    }
}

// MARK: - BA_BaseViewProtocol
extension BABaseViewController: BA_BaseViewProtocol {
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
