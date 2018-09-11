//
//  IDataProvider.swift
//  BASwift
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public protocol BAServiceProtocol {

    var serviceConfig: BAWebServiceConfig { get }

    init(withConfig config: BAWebServiceConfig)

    func execute<T: Decodable>(request: BAServiceRequest, onResponse:@escaping (BAServiceResponse<T>) -> Void) -> DataRequest

}
