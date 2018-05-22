//
//  BridgeProvider.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

public class BridgeProvider: IBridgeProvider {

    private(set) var  userBridge: IUserBridge

    private(set) var  productBridge: IProductBridge

    init() {
        self.userBridge = UserBridge()
        self.productBridge = ProductBridge()
    }

    public func getUserBridge() -> IUserBridge {
        return userBridge
    }

    public func getProductBridge() -> IProductBridge {
        return productBridge
    }

}
