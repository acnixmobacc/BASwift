//
//  BaseViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

extension BA_BaseViewController: BA_BaseViewProtocol {
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
}

open class BA_BaseViewController<T: BA_BaseViewModelProtocol> : UIViewController {
    public var viewModel: T?

    lazy var progressManager : ProgressHUDManager = {[unowned self] in
        return ProgressHUDManager(forView: self.view)
    }()
    
    lazy var alertManager : AlertViewManager = {[unowned self] in
        return AlertViewManager(withViewController: self)
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.onWillAppear()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.onDidAppear()
    }

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewModel?.onWillLayoutSubviews()
    }

    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel?.onDidLayoutSubviews()
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel?.onWillDisappear()
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel?.onDidDisappear()
    }
}
