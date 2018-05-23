//
//  LoginModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 23.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

protocol LoginModelDelegate: class {
    func onLoginSucceed(user: User)

    func onLoginFailed()
}

class LoginModel {
    weak var delegate: LoginModelDelegate?

    var userBridge: UserBridgeProtocol

    init() {
        self.userBridge = AppBridgeProvider.instance.userBridge
    }

    func login() {
        userBridge.getUser(onSuccess: {[weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.onLoginSucceed(user: response)
        }, onFailure: {[weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.onLoginFailed()
        })
    }
}
