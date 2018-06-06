//
//  ResponseProtocol.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public protocol ResponseProtocol {

    var httpResponse: HTTPURLResponse? { get }

    var httpStatusCode: Int? { get }

    var status: Alamofire.Result<Any> { get }

    var data: Data? { get }

    var error: Error? { get }

    var timeline: Timeline { get }

    var request: RequestProtocol { get }

    func toString(_ encoding: String.Encoding) -> String?
}
