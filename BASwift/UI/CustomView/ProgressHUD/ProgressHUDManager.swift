//
//  ProgressManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public enum ProgressStrategy{
    public enum DismissStrategy {
        case countable, immediately
    }
}


open class ProgressHUDManager : ILoadable{
    private var bussyCount: Int = 0{
        willSet{
            if(newValue == 1 && bussyCount == 0){
                progressHUD.start(inView: self.view)
            }else if(newValue == 0 && bussyCount > 0){
                progressHUD.stop()
            }
        }
    }
    
    public var progressHUD: IProgressHUD =  BA_DependencyManager.sharedInstance.container.resolve(IProgressHUD.self)!
    
    private var view: UIView
    
    private var dismissStrategy : ProgressStrategy.DismissStrategy
    
    public init(forView view:UIView, dismissStrategy:ProgressStrategy.DismissStrategy = .immediately) {
        self.dismissStrategy = dismissStrategy
        self.view = view
    }
    
    public func showLoading() {
        bussyCount += 1
    }
    
    public func hideLoading() {
        if(dismissStrategy == .immediately){
            bussyCount = 0
        }else{
            bussyCount -= 1
        }
    }
    
    public func isLoading() -> Bool {
        return progressHUD.isLoading
    }
    
}
