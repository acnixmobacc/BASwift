//
//  BaseProtocols.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol BA_BaseViewProtocol: class {
    func onUpdateView()

    func showProgress()
    
    func showAlert(_ alert:BaseAlert)

    func hideProgress()
}

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

public protocol BA_BaseModelProtocol: class {

}
