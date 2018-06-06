//
//  ProgressManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public enum ProgressStrategy {
    public enum DismissStrategy {
        case countable, immediately
    }
}

open class ProgressHUDManager: ILoadable {

    // MARK: - Private Properties
    private var bussyCount: Int = 0 {
        willSet {
            if(newValue == 1 && bussyCount == 0) {
                progressHUD.start(inView: self.view)
            } else if(newValue == 0 && bussyCount > 0) {
                progressHUD.stop()
            }
        }
    }

    private var view: UIView

    private var dismissStrategy: ProgressStrategy.DismissStrategy

    // MARK: - Properties
    public var progressHUD: IProgressHUD = BADependencyManager.sharedInstance.container.resolve(IProgressHUD.self)!

    // MARK: - Initialization
    public init(forView view: UIView, dismissStrategy: ProgressStrategy.DismissStrategy = .immediately) {
        self.dismissStrategy = dismissStrategy
        self.view = view
    }

    // MARK: - Methods
    public func showLoading() {
        bussyCount += 1
    }

    public func hideLoading() {
        if(dismissStrategy == .immediately) {
            bussyCount = 0
        } else {
            bussyCount -= 1
        }
    }

    public func isLoading() -> Bool {
        return progressHUD.isLoading
    }

}
