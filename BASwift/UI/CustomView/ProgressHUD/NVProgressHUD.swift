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
    
    var color : UIColor
    
    
    init(withFrame frame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 60),
         type: NVActivityIndicatorType = .ballGridPulse, color: UIColor = .white)
    {
        self.type = type
        self.color = color
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

    public func start(inView view: UIView) {
        parentView = view
        initTransparentView(withFrame: CGRect(x: 0, y: 0, width: (parentView?.frame.width)!,
                                              height: (parentView?.frame.height)!))
        setActivityIndicatorCenterPoint()
        
        parentView?.isUserInteractionEnabled = false
        transparentView?.addSubview(activityIndicator)
        parentView?.addSubview(transparentView!)
        activityIndicator.startAnimating()
    }

    public func stop() {
        transparentView?.removeFromSuperview()
        parentView?.isUserInteractionEnabled = true
        parentView = nil
        activityIndicator.stopAnimating()
    }
    

    
}
