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
         withStyle style: UIActivityIndicatorViewStyle = .gray)
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
    
    public func start(inView view:UIView) {
        self.activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        self.activityIndicator.startAnimating()
    }

    public func stop() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
}
