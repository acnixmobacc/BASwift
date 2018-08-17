//
//  IContentView.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol IContentManager {
    var view: UIView & IMessageView { get set }

    init(withView view: UIView & IMessageView)

    func showMessage(withMessage message: String, handler:(() -> Void)?)
}
