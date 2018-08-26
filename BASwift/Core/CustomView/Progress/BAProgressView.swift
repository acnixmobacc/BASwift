//
//  UIView+Loadable.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public class BAProgressView: UIView, Loadable, IContentable {
    // MARK: - Properties
    lazy open var progressHUD: ProgressHUDProtocol = {
        return NVProgressHUD(withOptions: NVProgressHUDOptions.nvProgressDefault)
    }()

    lazy open var errorViewManager: ErrorViewManagerProtocol = {
        var messageView = BAErrorView.fromNib()
        messageView.frame = CGRect(origin: .zero, size: self.frame.size)
        return ErrorViewManager(withView: messageView)
    }()

}
