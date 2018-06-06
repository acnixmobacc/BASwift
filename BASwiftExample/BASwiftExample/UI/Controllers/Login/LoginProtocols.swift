//
//  LoginProtocols.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 31.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

protocol LoginViewProtocol: class {
    func onLoginSucceed(user: User)

    func onLoginFailed()
}

protocol LoginViewModelProtocol: class {
    var viewDelegate: LoginViewProtocol? { get set }

    func login()

    func onLoginSucceed(user: User)

    func onLoginFailed()
}

protocol LoginModelProtocol: class {
    var viewModelDelegate: LoginViewModelProtocol? { get set }

    func login()
}
