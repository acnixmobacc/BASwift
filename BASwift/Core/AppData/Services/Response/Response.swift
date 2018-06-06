//
//  Response.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public class Response<T: Codable>: ResponseProtocol {

    // MARK: - Properties
    public var httpResponse: HTTPURLResponse?

    public var httpStatusCode: Int?

    public var status: Alamofire.Result<Any>

    public var data: Data?

    public var error: Error?

    public var timeline: Timeline

    public var request: RequestProtocol

    public var entity: T?

    public func toString(_ encoding: String.Encoding = .utf8) -> String? {
        guard let d = self.data else { return nil }
        return String(data: d, encoding: encoding)
    }

    // MARK: - Private Methods
    private func createEntity() -> T? {
        guard let data = self.data else {
            return nil
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error: Couldn't decode data into \(T.self)")
            return nil
        }
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
