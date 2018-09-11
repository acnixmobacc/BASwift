//
//  RequestProtocol.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public protocol BAServiceRequestProtocol {
    var endpoint: String { get }

    var header: HeaderDictionary { get }

    var param: JSONDictionary { get }

    var method: HTTPMethod { get }

    var encoding: ParameterEncoding { get }
}
