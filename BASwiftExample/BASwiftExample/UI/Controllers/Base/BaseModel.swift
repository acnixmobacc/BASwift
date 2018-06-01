//
//  BaseModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 31.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class BaseModel: BABaseModelProtocol {

    deinit {
        Logger.debug("Deinit \(self)")
    }

    required init() {

    }
}
