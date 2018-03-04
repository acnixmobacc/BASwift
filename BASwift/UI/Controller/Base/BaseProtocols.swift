//
//  BaseProtocols.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol BaseViewProtocol : class {
    weak var viewModel : BaseViewModelProtocol? {get set}
    
    init(viewModel:BaseViewModelProtocol?)
    
    func onUpdateView()
}

extension BaseViewProtocol where Self:UIViewController{
    init(viewModel:BaseViewModelProtocol?) {
        self.init()
        self.viewModel = viewModel
    }
}

public protocol BaseViewModelProtocol : class {
    init()
    
    func initWithData(data: [Any?])
    
    func onDidLoad()
    
    func onWillAppear()
    
    func onDidAppear()
    
    func onWillDisappear()
    
    func onDidDisappear()
    
    func onWillLayoutSubviews()
    
    func onDidLayoutSubviews()
    
    func onBackCompletion(_ data: [Any?]?)

}

public protocol BaseModelProtocol : class {
    
}
