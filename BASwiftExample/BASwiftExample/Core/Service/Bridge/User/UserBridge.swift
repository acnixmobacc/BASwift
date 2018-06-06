//
//  UserBridge.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class UserBridge: UserBridgeProtocol {

    private(set) var userServiceAdapter: UserServiceAdapterProtocol

    private(set) var localUserDataProvider: LocalUserDataProvider

    init() {
        userServiceAdapter = AppWebServiceProvider.instance.userServiceAdapter
        localUserDataProvider = LocalDataProvider.instance.localUserDataProvider
    }

    func getUser( onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error?) -> Void) {
        if !localUserDataProvider.user.isEmpty() {
            onSuccess(localUserDataProvider.user)
        } else {
            userServiceAdapter.getUser(onSuccess: {[weak self] user in
                guard let strongSelf = self else { return }
                strongSelf.localUserDataProvider.putUser(user: user)
                onSuccess(user)
            }, onFailure: {error in
                onFailure(error)
            })
        }
    }
}
