//
//  LoadableViewProtocol.swift
//  BASwift
//
//  Created by Burak Akkaya on 25.08.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol ErrorDisplayable: class {

    var errorView: UIView & ErrorViewProtocol { get set }

    func showError(with message: String, frame: CGRect?, retry: (() -> Void)?)

    func hideError()

}

public extension ErrorDisplayable where Self: UIView {
    func showError(with message: String, frame: CGRect?, retry: (() -> Void)?) {
        errorView.removeFromSuperview()
        errorView.show(with: message)
        errorView.handler = retry

        guard let contentViewFrame = frame else {
            errorView.frame = self.bounds
            self.addSubview(errorView)
            return
        }

        errorView.frame = contentViewFrame
        self.addSubview(errorView)
    }

    func hideError() {
        errorView.removeFromSuperview()
    }
}
