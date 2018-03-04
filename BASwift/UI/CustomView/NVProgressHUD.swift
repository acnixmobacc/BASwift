//
//  NVProgressHUD.swift
//  BASwift
//
//  Created by Burak Akkaya on 3.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//
import NVActivityIndicatorView
import UIKit

open class NVProgressHUD: IProgressHUD {
    var activityIndicator: NVActivityIndicatorView!
    var viewController: UIViewController?
    var transparentView: UIView
    
    public init(type: NVActivityIndicatorType = .ballGridPulse, color: UIColor = .white,
                frame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 60)) {
        activityIndicator = NVActivityIndicatorView(frame: frame, type: type, color: color)
        transparentView = UIView(frame: CGRect(x: 0, y: 0,
                                               width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        transparentView.backgroundColor = UIColor.animationBackground
        activityIndicator.layer.cornerRadius = 3
        activityIndicator.clipsToBounds = true
        
    }
    
    public func start(withController viewController: UIViewController?) {
        activityIndicator.center = (viewController?.view.center)!
        self.viewController = viewController!
        viewController?.view.isUserInteractionEnabled = false
        transparentView = UIView(frame: CGRect(x: 0, y: 0,
                                               width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        transparentView.backgroundColor = UIColor.animationBackground
        transparentView.addSubview(self.activityIndicator)
        viewController?.view.addSubview(self.transparentView)
        activityIndicator.startAnimating()
    }
    
    public func stop() {
        transparentView.removeFromSuperview()
        viewController?.view.isUserInteractionEnabled = true
        viewController = nil
        activityIndicator.stopAnimating()
    }
}

