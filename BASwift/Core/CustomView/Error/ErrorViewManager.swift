//
//  ContentManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class ErrorViewManager: ErrorViewManagerProtocol {

    // MARK: - Properties
    public var view: UIView & ErrorViewProtocol

    // MARK: - Initialization
    required public init(withView view: UIView & ErrorViewProtocol) {
        self.view = view
    }

    // MARK: - Methods
    public func showError(with message: String, handler: (() -> Void)? = nil) {
        self.view.showMessage(withMessage: message)
        self.view.handler = handler
    }

    public func hideError() {
        self.view.removeFromSuperview()
        self.view.handler = nil
    }
}
