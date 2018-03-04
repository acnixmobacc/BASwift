//
//  BaseViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class BA_BaseViewController : UIViewController, BA_BaseViewProtocol{
    public var viewModel: BA_BaseViewModelProtocol?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onDidLoad()
    }
    
    public func onUpdateView() {
        
    }
    
    
}
