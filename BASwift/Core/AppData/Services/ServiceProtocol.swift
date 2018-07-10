//
//  IDataProvider.swift
//  BASwift
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public protocol ServiceProtocol {

    var serviceConfig: ServiceConfig { get }

    init(withConfig config: ServiceConfig)

    func execute<T: Decodable>(request: APIRequest, onResponse:@escaping (Response<T>) -> Void) -> DataRequest

}
