//
//  AppDataProvider.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class AppDataProvider {

    // MARK: - Singleton
    static let instance = AppDataProvider()

    // MARK: - Properties
    public var bridgeProvider: IBridgeProvider

    public var serviceProvider: IServiceProvider

    // MARK: - Initialization
    private init() {
        bridgeProvider = BridgeProvider()
        serviceProvider = ServiceProvider()
    }
}
