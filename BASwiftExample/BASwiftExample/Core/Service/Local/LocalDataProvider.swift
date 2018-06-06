//
//  LocalServiceProvider.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 23.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class LocalDataProvider {

    static let instance: LocalDataProvider = LocalDataProvider()

    private(set) var localUserDataProvider: LocalUserDataProvider

    private init() {
        self.localUserDataProvider = LocalUserDataProvider()
    }

}
