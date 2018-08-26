//
//  IContentable.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol IContentable {
    var errorViewManager: ErrorViewManagerProtocol { get }

    func showMessage(withMessage message: String, handler: (() -> Void)?)
}

// MARK: - Content View
public extension IContentable where Self: UIView {

    func showMessage(withMessage message: String, handler: (() -> Void)?) {
        errorViewManager.showError(with: message) {[unowned self] in
            self.errorViewManager.view.removeFromSuperview()
            if let handler = handler {
                handler()
            }
        }

        self.addSubview(errorViewManager.view)
    }
}
