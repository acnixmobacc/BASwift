//
//  ILoadable.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol ILoadable {
    var progressHUD: IProgressHUD { get set }
    
    func showLoading()
    
    func hideLoading()
    
    func isLoading() -> Bool
}

//MARK: - Loadable View
public extension ILoadable where Self:UIView {
    public func showLoading() {
        progressHUD.start(inView: self)
    }
    
    public func hideLoading() {
        progressHUD.stop()
    }
    
    public func isLoading() -> Bool {
        return progressHUD.isLoading
    }
}
