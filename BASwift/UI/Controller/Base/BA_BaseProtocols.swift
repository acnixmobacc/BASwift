//
//  BaseProtocols.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol BA_BaseViewProtocol : class {
    weak var viewModel : BA_BaseViewModelProtocol? {get set}
    
    init(viewModel:BA_BaseViewModelProtocol?)
    
    func onUpdateView()
}

extension BA_BaseViewProtocol where Self:UIViewController{
    public init(viewModel:BA_BaseViewModelProtocol?) {
        self.init()
        self.viewModel = viewModel
    }
}

public protocol BA_BaseViewModelProtocol : class {
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

public protocol BA_BaseModelProtocol : class {
    
}
