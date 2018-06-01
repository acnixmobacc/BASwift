//
//  LoginViewModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class LoginViewModel: BaseViewModel {

    private(set) var model: LoginModelProtocol!

    weak var view: LoginViewProtocol?

    required init() {
        model = LoginModel()
        super.init()
        model.viewModel = self
    }

}

extension LoginViewModel: LoginViewModelProtocol {

    func login() {
        model.login()
    }

    func onLoginSucceed(user: User) {
        view?.onLoginSucceed(user: user)
    }

    func onLoginFailed() {
        view?.onLoginFailed()
    }
}
