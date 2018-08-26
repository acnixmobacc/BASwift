//
//  IContentView.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol ErrorViewManagerProtocol {
    var view: UIView & ErrorViewProtocol { get set }

    init(withView view: UIView & ErrorViewProtocol)

    func showError(with message: String, handler:(() -> Void)?)

    func hideError()
}
