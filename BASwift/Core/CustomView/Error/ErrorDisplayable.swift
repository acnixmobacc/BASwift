//
//  LoadableViewProtocol.swift
//  BASwift
//
//  Created by Burak Akkaya on 25.08.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol ErrorDisplayable: class {

    func showError(with message: String, frame: CGRect?, retry: (() -> Void)?)

    func hideError()

}

extension ErrorDisplayable where Self: BABaseViewController {

    func showError(with message: String, frame: CGRect? = nil, handler: (() -> Void)?) {
        errorViewManager.showError(with: message, handler: { [unowned self] in
            self.errorViewManager.view.removeFromSuperview()
            if let handler = handler {
                handler()
            }
        })

        guard let contentViewFrame = frame else {
            errorViewManager.view.frame = self.view.bounds
            self.view.addSubview(errorViewManager.view)
            return
        }

        errorViewManager.view.frame = contentViewFrame
        self.view.addSubview(errorViewManager.view)

    }

    func hideError() {
        errorViewManager.hideError()
    }

}
