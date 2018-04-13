//
//  BaseProtocols.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

//MARK: - View Interface
public protocol BA_BaseViewProtocol: class {
    func onUpdateView()

    func showProgress()
    
    func showAlert(_ alert:BaseAlert)

    func hideProgress()
    
    func showContentMessage(withMessage message:String, handler:(()->Void)?)
}

//MARK: - View Model Interface
public protocol BA_BaseViewModelProtocol: class {
    init()

    func initWithData(data: [Any?])

    func onDidLoad()

    func onWillAppear()

    func onDidAppear()

    func onWillDisappear()

    func onDidDisappear()

    func onWillLayoutSubviews()

    func onDidLayoutSubviews()
}

//MARK: - Model Interface
public protocol BA_BaseModelProtocol: class {

}
