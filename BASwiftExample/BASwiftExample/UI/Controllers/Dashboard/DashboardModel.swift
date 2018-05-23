//
//  DashboardModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 23.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class DashboardModel {

    var localUserProvider: LocalUserDataProvider

    init() {
        self.localUserProvider = LocalDataProvider.instance.localUserDataProvider
    }

}
