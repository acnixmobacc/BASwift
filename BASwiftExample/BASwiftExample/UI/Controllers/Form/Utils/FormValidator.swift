//
//  FormValidator.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 10.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class FormValidator {

    class func isValidUsername(value: String) -> Bool {
        let pattern = "^[^<>!@#$%^&*()0-9]*$"
        return value.isMatch(regex: pattern)
    }

}
