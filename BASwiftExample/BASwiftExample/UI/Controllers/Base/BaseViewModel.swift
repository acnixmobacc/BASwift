//
//  BaseViewModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 27.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class BaseViewModel: BABaseViewModel {

    deinit {
        Logger.debug("Deinit \(self)")
    }
}
