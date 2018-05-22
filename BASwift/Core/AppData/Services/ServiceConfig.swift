//
//  ServiceConfig.swift
//  BASwift
//
//  Created by Burak Akkaya on 21.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public class ServiceConfig {

    private(set) var baseURL: String

    private(set) var timeout: TimeInterval

    private(set) var cachePolicy: URLRequest.CachePolicy

    public init(baseURL: String, timeout: TimeInterval = 30.0, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
        self.baseURL = baseURL
        self.timeout = timeout
        self.cachePolicy = cachePolicy
    }
}
