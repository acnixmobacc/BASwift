//
//  BaseProgressHUD.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 10/02/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import UIKit

open class NativeProgressOptions : ProgressOptions{
    var style : UIActivityIndicatorViewStyle
    
    init(withFrame frame: CGRect = CGRect(x: 100, y: 100, width: 100, height: 100),
         withStyle style: UIActivityIndicatorViewStyle = .white)
    {
        self.style = style
        super.init(withFrame: frame)
    }
    
    static let `nativeDefault`: ProgressOptions = {
        return NativeProgressOptions()
    }()
    
}

public class BaseProgressHUD: IProgressHUD {
    public var options: ProgressOptions
    
    var activityIndicator: UIActivityIndicatorView!
    
    var transparentView: UIView?
    
    public required init(withOptions options: ProgressOptions) {
        self.options = options
        setProgressOptions()
    }
    
    private func setProgressOptions(){
        guard let nativeProgressOption = options as? NativeProgressOptions else{
            fatalError("Option not for native indicatoır")
        }
        self.activityIndicator = UIActivityIndicatorView(frame: nativeProgressOption.frame)
        self.activityIndicator.activityIndicatorViewStyle = nativeProgressOption.style
    }
    
    private func initTransparentView(withFrame frame:CGRect = .zero){
        transparentView = UIView(frame: frame)
        transparentView?.backgroundColor = UIColor.animationBackground
    }
    
    private func setActivityIndicatorCenterPoint(inView view:UIView){
        let centerX = view.frame.width / 2.0
        let centerY = view.frame.height / 2.0
        activityIndicator.center = CGPoint(x: centerX, y: centerY)
    }
    
    public func start(inView view:UIView) {
        options.showTransparentView ? startWithTransparentView(inView: view) 
            : startWithoutTransparentView(inView: view)
        
        setActivityIndicatorCenterPoint(inView:view)
        self.activityIndicator.startAnimating()
    }
    
    private func startWithTransparentView(inView view:UIView){
        initTransparentView(withFrame: CGRect(x: 0, y: 0, width: view.frame.width,
                                              height: view.frame.height))
        transparentView?.addSubview(activityIndicator)
        view.addSubview(transparentView!)
    }
    
    private func startWithoutTransparentView(inView view:UIView){
        view.addSubview(activityIndicator)
    }

    public func stop() {
        transparentView?.removeFromSuperview()
        self.activityIndicator.stopAnimating()
    }
}
