//
//  BaseErrorResponse.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//
import Alamofire
import SwiftyJSON

open class BaseErrorResponse: NSObject {
    let unexpectedMessage: String = "Beklenmedik bir hata oluştu lütfen daha sonra tekrar deneyiniz."

    public var serviceError: Error?
    public var httpUrlResponse: HTTPURLResponse?
    public var baseErrorMessage: String

    required public init(httpResponse: HTTPURLResponse? = nil, serviceError: Error? = nil, errorMessage: String? = nil) {
        self.serviceError = serviceError
        self.httpUrlResponse = httpResponse

        if let message = errorMessage {
            self.baseErrorMessage = message
        } else if let error = serviceError {
            if error.localizedDescription.isEmpty {
                self.baseErrorMessage = unexpectedMessage
            } else {
                self.baseErrorMessage = error.localizedDescription
            }
        } else {
            self.baseErrorMessage = unexpectedMessage
        }

    }

}
