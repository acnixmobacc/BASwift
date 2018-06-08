//
//  LoginViewModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

extension LoginViewModel: LoginViewModelProtocol {

    func login() {
        model.login()
    }

    func onLoginSucceed(user: User) {
        viewDelegate?.onLoginSucceed(user: user)
    }

    func onLoginFailed() {
        viewDelegate?.onLoginFailed()
    }
}

class LoginViewModel: BaseViewModel {

    private(set) var model: LoginModelProtocol!

    weak var viewDelegate: LoginViewDelegate?

    required init() {
        model = LoginModel()
        super.init()
        model.viewModelDelegate = self
    }
}
