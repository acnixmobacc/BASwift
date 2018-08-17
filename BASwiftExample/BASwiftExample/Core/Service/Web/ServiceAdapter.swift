//
//  ServiceAdapter.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

public class ServiceAdapter {
    var service: BAWebService

    init(withService service: BAWebService) {
        self.service = service
    }
}
