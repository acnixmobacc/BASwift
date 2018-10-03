//
//  FormValidator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 10.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import Foundation

class ValidationResult: ValidationResultProtocol {
    var errorMessage: String

    init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
}

class UsernameRule: ValidationRuleProtocol {
    var validationResult: ValidationResultProtocol? = {
        return ValidationResult(errorMessage: "This field must be contains only characters")
    }()

    func validate(value: Any?) -> Bool {
        guard let text = value as? String else {
            return false
        }

        let pattern = "^[^<>!@#$%^&*()0-9]*$"

        return text.isMatch(regex: pattern)
    }
}

class RequiredRule: ValidationRuleProtocol {
    var validationResult: ValidationResultProtocol? = {
        return ValidationResult(errorMessage: "This field is required")
    }()

    func validate(value: Any?) -> Bool {
        guard let text = value as? String else {
            return false
        }

        return !text.isEmpty
    }

}
