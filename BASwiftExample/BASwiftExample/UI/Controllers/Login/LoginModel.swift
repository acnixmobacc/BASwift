//
//  LoginModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 23.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class LoginModel: BaseModel {

    var viewModel: LoginViewModelProtocol?

    var userBridge: UserBridgeProtocol

    required init() {
        self.userBridge = AppBridgeProvider.instance.userBridge
    }

}

extension LoginModel: LoginModelProtocol {

    func login() {
        userBridge.getUser(onSuccess: {[weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.viewModel?.onLoginSucceed(user: response)
            }, onFailure: {[weak self] _ in
                guard let strongSelf = self else { return }
                strongSelf.viewModel?.onLoginFailed()
        })
    }
}
