//
//  BaseProgressHUD.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 10/02/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import UIKit

public protocol IProgressHUD {
    func start(withController viewController: UIViewController?)
    func stop()
}

public class BaseProgressHUD: IProgressHUD {

    var activityIndicator: UIActivityIndicatorView!

    required public init() {
        self.activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 100, y: 100, width: 100,
                                                                       height: 100))
        self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
    }

    public func start(withController viewController: UIViewController?) {
        self.activityIndicator.center = (viewController?.view.center)!
        viewController?.view.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
    }

    public func stop() {
        self.activityIndicator.removeFromSuperview()
    }
}
