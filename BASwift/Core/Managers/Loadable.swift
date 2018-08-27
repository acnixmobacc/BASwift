//
//  Loadable.swift
//  BASwift
//
//  Created by Burak Akkaya on 25.08.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol Loadable: class {

    var isLoading: Bool { get }

    var progressHUD: ProgressHUDProtocol { get set }

    func showProgress()

    func hideProgress()

}

public extension Loadable {

    func hideProgress() {
        progressHUD.hide()
    }

    var isLoading: Bool {
        return progressHUD.isLoading
    }
}

public extension Loadable where Self: UIView {

    func showProgress() {
        progressHUD.show(in: self)
    }
}
