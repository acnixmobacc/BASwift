//
//  LoginProtocols.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 31.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

// MARK: - View Interfaces
protocol LoginViewProtocol: LoginViewDelegate {}

protocol LoginViewDelegate: class {
    func onLoginSucceed(user: User)

    func onLoginFailed()
}

// MARK: - ViewModel Interfaces
protocol LoginViewModelProtocol: LoginViewModelDelegate {
    var viewDelegate: LoginViewDelegate? { get set }

    func login()
}

protocol LoginViewModelDelegate: class {
    func onLoginSucceed(user: User)

    func onLoginFailed()
}

// MARK: - Model Interfaces
protocol LoginModelProtocol: class {
    var viewModelDelegate: LoginViewModelDelegate? { get set }

    func login()
}
