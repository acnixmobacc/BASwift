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
            userServiceAdapter.getUser(onSuccess: { response in
                onSuccess(response)
            }, onError: {error in
                onFailure(error)
            })
        }
    }
}
