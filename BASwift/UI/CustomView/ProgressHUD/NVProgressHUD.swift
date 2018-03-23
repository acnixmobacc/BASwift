//
//  NVProgressHUD.swift
//  BASwift
//
//  Created by Burak Akkaya on 3.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//
import NVActivityIndicatorView
import UIKit

open class NVProgressOptions : ProgressOptions{
    var type : NVActivityIndicatorType
    
    var userInteractionEnabled:Bool
    
    var color : UIColor
    
    
    init(withFrame frame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 60),
         type: NVActivityIndicatorType = .ballGridPulse, color: UIColor = .white,
         userInteractionEnabled:Bool = true)
    {
        self.type = type
        self.color = color
        self.userInteractionEnabled = userInteractionEnabled
        super.init(withFrame: frame)
    }
    
    static let `nvProgressDefault`: ProgressOptions = {
        return NVProgressOptions()
    }()
}

open class NVProgressHUD: IProgressHUD {
    public var options: ProgressOptions
    
    var activityIndicator: NVActivityIndicatorView!
    
    var parentView: UIView?
    
    var transparentView: UIView?
    
    public required init(withOptions options: ProgressOptions)
    {
        self.options = options
        setActivityIndicatorOption()
    }

    public func start(inView view: UIView) {
        parentView = view
        options.showTransparentView ? startWithTransparentView(inView: view)
            : startWithoutTransparentView(inView: view)
        setActivityIndicatorCenterPoint()
        activityIndicator.startAnimating()
        
    }
    
    public func stop() {
        transparentView?.removeFromSuperview()
        parentView?.isUserInteractionEnabled = true
        parentView = nil
        activityIndicator.stopAnimating()
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

    private func setUserInteractionStatus(){
        guard let nvOptions = options as? NVProgressOptions else {
            fatalError("Options not nvprogressoption")
        }
        
        parentView?.isUserInteractionEnabled = nvOptions.userInteractionEnabled
    }

    private func setActivityIndicatorOption(){
        guard let nvOptions = options as? NVProgressOptions else {
            fatalError("Options not nvprogressoption")
        }
        
        activityIndicator = NVActivityIndicatorView(frame: nvOptions.frame, type: nvOptions.type, color: nvOptions.color)
        activityIndicator.layer.cornerRadius = 3
        activityIndicator.clipsToBounds = true
    }
    
    private func initTransparentView(withFrame frame:CGRect = .zero){
        transparentView = UIView(frame: frame)
        transparentView?.backgroundColor = UIColor.animationBackground
    }
    
    private func setActivityIndicatorCenterPoint(){
        let centerX = (parentView?.frame.width)! / 2.0
        let centerY = (parentView?.frame.height)! / 2.0
        activityIndicator.center = CGPoint(x: centerX, y: centerY)
    }
    
}
