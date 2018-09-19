//
//  LoginModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 23.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

extension LoginModel: LoginModelProtocol {

    func login() {
        userBridge.getUser(onSuccess: {[weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.viewModelDelegate?.onLoginSucceed(user: response)
        }, onFailure: {[weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.viewModelDelegate?.onLoginFailed()
        })
    }
}

class LoginModel: BaseModel {

    weak var viewModelDelegate: LoginViewModelDelegate?

    var userBridge: UserBridgeProtocol

    override init() {
        self.userBridge = AppBridgeProvider.instance.userBridge
    }

}
