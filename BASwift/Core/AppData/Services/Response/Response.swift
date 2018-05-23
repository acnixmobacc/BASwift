//
//  Response.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire
import SwiftyJSON

public class Response<T: IEntity>: ResponseProtocol {

    // MARK: - Properties
    public var httpResponse: HTTPURLResponse?

    public var httpStatusCode: Int?

    public var status: Alamofire.Result<Any>

    public var data: Data?

    public var error: Error?

    public var timeline: Timeline

    public var request: RequestProtocol

    public var entity: T?

    // MARK: - Methods
    public func toJSON() -> JSON {
        return cachedJSON
    }

    public func toString(_ encoding: String.Encoding = .utf8) -> String? {
        guard let d = self.data else { return nil }
        return String(data: d, encoding: encoding)
    }

    // MARK: - Private Properties
    private lazy var cachedJSON: JSON = {
        return JSON(data: self.data ?? Data())
    }()

    // MARK: - Private Methods
    private func createEntity() -> T? {
        guard let _ = self.data else {
            return nil
        }

        return T(withData: toJSON())
    }

    // MARK: - Initializition
    public init(dataResponse: DataResponse<Any>, request: RequestProtocol) {
        self.data = dataResponse.data
        self.httpResponse = dataResponse.response
        self.httpStatusCode = dataResponse.response?.statusCode
        self.error = dataResponse.error
        self.timeline = dataResponse.timeline
        self.request = request
        self.status = dataResponse.result
        self.entity = createEntity()
    }

}
