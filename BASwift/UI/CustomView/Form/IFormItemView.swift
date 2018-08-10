//
//  IFormItemView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 8.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol IFormItemView {
    var value: Any? { get }

    var itemViewHeight: CGFloat { get }

    var onValidation: (() -> Any?)? { get }

    var onClick: ((Any?) -> Void)? { get }

    var onChange: ((Any?) -> Void)? { get }

    var didChange: ((Any?) -> Void)? { get }

    var didCancel: ((Any?) -> Void)? { get }

    func onSuccess()

    func onError()
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

    var onValidation : (() -> Any?)? {
        get {
            return nil
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

    func onSuccess() {

    }

    func onError() {

    }

}
// swiftlint:enable implicit_getter
