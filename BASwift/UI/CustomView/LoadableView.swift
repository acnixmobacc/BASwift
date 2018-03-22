//
//  UIView+Loadable.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol ILoadable {
    var progressHUD: IProgressHUD { get set }

    func showLoading()

    func hideLoading()
}

extension ILoadable where Self:UIView {
    public func showLoading() {
        progressHUD.start(inView: self)
    }

    public func hideLoading() {
        progressHUD.stop()
    }
}

public class LoadableView: UIView, ILoadable {
    public var progressHUD = BA_DependencyManager.sharedInstance.container.resolve(IProgressHUD.self)!
}
