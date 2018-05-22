//
//  RequestInformation.swift
//  BASwift
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public typealias JSONDictionary = [String: Any]?

public typealias HeaderDictionary = [String: String]?

public class Request: RequestProtocol {

    // MARK: - Properties
    public var endpoint: String

    public var header: HeaderDictionary

    public var param: JSONDictionary

    public var method: HTTPMethod

    public var encoding: ParameterEncoding

    // MARK: - Initialization
    public init(method: HTTPMethod = .get, endpoint: String, header: HeaderDictionary = nil, param: JSONDictionary = nil,
                encoding: ParameterEncoding = URLEncoding.default ) {
        self.endpoint = endpoint
        self.header = header
        self.param = param
        self.method = method
        self.encoding = encoding

    }

}
