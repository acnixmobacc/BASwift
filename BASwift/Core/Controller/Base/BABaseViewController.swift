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
    lazy open var progressHUD: ProgressHUDProtocol = {[unowned self] in
        return NVProgressHUD(withOptions: NVProgressHUDOptions.nvProgressDefault)
    }()

    lazy open var alertManager: IAlertManager = {[unowned self] in
        return AlertViewManager(alertView: BaseAlertView(), with: self)
    }()

    lazy open var errorViewManager: ErrorViewManagerProtocol = {[unowned self] in
        let bundle = Bundle(for: BAErrorView.self)
        return ErrorViewManager(withView: BAErrorView.fromNib(bundle: bundle))
    }()
}

open class BABaseTabController: UITabBarController, BABaseViewProtocol {

    // MARK: - Properties
    lazy open var progressHUD: ProgressHUDProtocol = {[unowned self] in
        return NVProgressHUD(withOptions: NVProgressHUDOptions.nvProgressDefault)
    }()

    lazy open var alertManager: IAlertManager = {[unowned self] in
        return AlertViewManager(alertView: BaseAlertView(), with: self)
    }()

    lazy open var errorViewManager: ErrorViewManagerProtocol = {[unowned self] in
        let bundle = Bundle(for: BAErrorView.self)
        return ErrorViewManager(withView: BAErrorView.fromNib(bundle: bundle))
    }()
}
