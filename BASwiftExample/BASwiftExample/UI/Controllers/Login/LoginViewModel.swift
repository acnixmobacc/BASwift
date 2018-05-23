//
//  LoginViewModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class LoginViewModel: BaseViewModel {

    private(set) var model: LoginModel

    required init() {
        model = LoginModel()
        super.init()
        model.delegate = self
    }

    func login() {
        model.login()
    }
}

extension LoginViewModel: LoginModelDelegate {
    func onLoginSucceed(user: User) {
        Logger.info("Login succeed")
    }

    func onLoginFailed() {
        Logger.info("Login failed")
    }

}
