//
//  BaseViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController, BaseViewProtocol{
    var viewModel: BaseViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onDidLoad()
    }
    
    public func onUpdateView() {
        
    }
    
    
}
