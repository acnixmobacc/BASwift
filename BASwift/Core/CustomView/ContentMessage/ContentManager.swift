//
//  ContentManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class ContentManager: IContentManager {

    // MARK: - Properties
    public var view: UIView & IMessageView

    // MARK: - Initialization
    required public init(withView view: UIView & IMessageView) {
        self.view = view
    }

    // MARK: - Methods
    public func showMessage(withMessage message: String, handler: (() -> Void)? = nil) {
        self.view.showMessage(withMessage: message)
        self.view.handler = handler
    }
}
