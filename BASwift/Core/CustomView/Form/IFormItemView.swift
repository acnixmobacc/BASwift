//
//  IFormItemView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 8.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol ValidationResultProtocol: Error {
    var errorMessage: String { get set }
}

public protocol ValidationRuleProtocol {
    var validationResult: ValidationResultProtocol? { get set }

    func validate(value: Any?) -> Bool
}

public protocol IFormItemView {
    var value: Any? { get }

    var validationRules: [ValidationRuleProtocol]? { get set }

    var itemViewHeight: CGFloat { get }

    var onClick: ((Any?) -> Void)? { get }

    var onChange: ((Any?) -> Void)? { get }

    var didChange: ((Any?) -> Void)? { get }

    var didCancel: ((Any?) -> Void)? { get }

    func validate() -> ValidationResultProtocol?
}

// swiftlint:disable implicit_getter
public extension IFormItemView {

    var value: Any? {
        get {
            return nil
        }
    }

    var itemViewHeight: CGFloat {
        get {
            return 44.0
        }
    }

    var onClick: ((Any?) -> Void)? {
        get {
            return nil
        }
    }

    var onChange: ((Any?) -> Void)? {
        get {
            return nil
        }
    }

    var didChange: ((Any?) -> Void)? {
        get {
            return nil
        }
    }

    var didCancel: ((Any?) -> Void)? {
        get {
            return nil
        }
    }

    func validate() -> ValidationResultProtocol? {
        guard let rules = self.validationRules else {
            return nil
        }

        for rule in rules {
            if !rule.validate(value: self.value) {
                return rule.validationResult
            }
        }

        return nil
    }

}
// swiftlint:enable implicit_getter
