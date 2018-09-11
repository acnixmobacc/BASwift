//
//  ServiceProvider.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

public class AppWebServiceProvider {

    private(set) var carServiceAdapter: CarServiceAdapterProtocol

    private(set) var userServiceAdapter: UserServiceAdapterProtocol

    private(set) var service: BAWebService

    static let instance: AppWebServiceProvider = AppWebServiceProvider()

    private init() {
        self.service = BAWebService(withConfig: BAWebServiceConfig(baseURL: "http://localhost:8000"))
        self.carServiceAdapter = CarServiceAdapter(withService: service)
        self.userServiceAdapter = UserServiceAdapter(withService: service)
    }
}
