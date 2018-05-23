//
//  BridgeProvider.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

public class AppBridgeProvider {

    private(set) var userBridge: UserBridgeProtocol

    static let instance: AppBridgeProvider = AppBridgeProvider()

    private init() {
        self.userBridge = UserBridge()
    }

}
