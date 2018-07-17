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
    lazy open var progressManager: ILoadable = {[unowned self] in
        return ProgressHUDManager(progressHud: NVProgressHUD(withOptions: NVProgressOptions.nvProgressDefault), forView: self.view)
    }()

    lazy open var alertManager: IAlertManager = {[unowned self] in
        return AlertViewManager(alertView: BaseAlertView(), with: self)
    }()

    lazy open var contentManager: IContentManager = {[unowned self] in
        return ContentManager(withView: MessageView.fromNib())
    }()
}

open class BABaseTabController: UITabBarController, BABaseViewProtocol {

    // MARK: - Properties
    lazy open var progressManager: ILoadable = {[unowned self] in
        return ProgressHUDManager(progressHud: NVProgressHUD(withOptions: NVProgressOptions.nvProgressDefault), forView: self.view)
    }()

    lazy open var alertManager: IAlertManager = {[unowned self] in
        return AlertViewManager(alertView: BaseAlertView(), with: self)
    }()

    lazy open var contentManager: IContentManager = {[unowned self] in
        return ContentManager(withView: MessageView.fromNib())
    }()
}
