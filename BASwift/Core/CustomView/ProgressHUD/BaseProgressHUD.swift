//
//  BaseProgressHUD.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 10/02/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import UIKit

public class BaseProgressHUD: ProgressHUDProtocol {

    // MARK: - Properties
    public var isLoading: Bool

    public var options: ProgressHUDOptions

    var activityIndicator: UIActivityIndicatorView!

    var transparentView: UIView?

    // MARK: - Initialization
    public required init(withOptions options: ProgressHUDOptions) {
        self.options = options
        self.isLoading = false
        setProgressOptions()
    }

    // MARK: - Methods
    public func show(in view: UIView) {
        isLoading = true
        options.showTransparentView ? startWithTransparentView(inView: view)
            : startWithoutTransparentView(inView: view)

        setActivityIndicatorCenterPoint(inView: view)
        self.activityIndicator.startAnimating()
    }

    public func hide() {
        isLoading = false
        transparentView?.removeFromSuperview()
        self.activityIndicator.stopAnimating()
    }

    // MARK: - Private Methods
    private func setProgressOptions() {
        guard let nativeProgressOption = options as? NativeProgressHUDOptions else {
            fatalError("Option not for native indicatoır")
        }
        self.activityIndicator = UIActivityIndicatorView(frame: nativeProgressOption.frame)
        self.activityIndicator.style = nativeProgressOption.style
    }

    private func initTransparentView(withFrame frame: CGRect = .zero) {
        transparentView = UIView(frame: frame)
        transparentView?.backgroundColor = UIColor.animationBackground
    }

    private func setActivityIndicatorCenterPoint(inView view: UIView) {
        let centerX = view.frame.width / 2.0
        let centerY = view.frame.height / 2.0
        activityIndicator.center = CGPoint(x: centerX, y: centerY)
    }

    private func startWithTransparentView(inView view: UIView) {
        initTransparentView(withFrame: CGRect(x: 0, y: 0, width: view.frame.width,
                                              height: view.frame.height))
        transparentView?.addSubview(activityIndicator)
        view.addSubview(transparentView!)
    }

    private func startWithoutTransparentView(inView view: UIView) {
        view.addSubview(activityIndicator)
    }

}
