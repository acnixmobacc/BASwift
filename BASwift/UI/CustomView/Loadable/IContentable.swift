//
//  IContentable.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol IContentable {
    var contentManager: IContentManager { get }

    func showMessage(withMessage message: String, handler: (() -> Void)?)
}

// MARK: - Content View
public extension IContentable where Self: UIView {

    func showMessage(withMessage message: String, handler: (() -> Void)?) {
        contentManager.showMessage(withMessage: message) {[unowned self] in
            self.contentManager.view.removeFromSuperview()
            if let handler = handler {
                handler()
            }
        }

        self.addSubview(contentManager.view)
    }
}
