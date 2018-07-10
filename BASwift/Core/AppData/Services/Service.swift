//
//  WebService.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public class Service: ServiceProtocol {

    // MARK: - Properties
    public var serviceConfig: ServiceConfig

    private(set) var sessionManager: Alamofire.SessionManager

    // MARK: - Initialization
    public required init(withConfig config: ServiceConfig) {
        self.serviceConfig = config
        self.sessionManager = Alamofire.SessionManager(configuration: Service.createURLSession(withConfig: config))
    }

    // MARK: - Execute Methods
    @discardableResult
    public func execute<T: Decodable>(request: APIRequest, onResponse:@escaping (Response<T>) -> Void) -> DataRequest {

        let dataRequest = createRequest(request)

        dataRequest.validate().responseJSON(completionHandler: { dataResponse in
            onResponse(Response(dataResponse: dataResponse, request: request))
        })

        return dataRequest
    }

    // MARK: - Private Methods
    fileprivate static func createURLSession(withConfig config: ServiceConfig) -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = config.timeout
        configuration.timeoutIntervalForResource = config.timeout
        configuration.requestCachePolicy = config.cachePolicy
        return configuration
    }

    fileprivate func createRequest(_ request: APIRequest) -> DataRequest {
        guard let url = URL(string: serviceConfig.baseURL + request.endpoint) else {
            fatalError("URL not valid")
        }

        return sessionManager.request(url, method: request.method, parameters: request.param,
                                      encoding: request.encoding, headers: request.header)
    }
}
