//
//  IXStack.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 07/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class BASStack<T> {

    // MARK: - Properties
    fileprivate var array: [T]

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    // MARK: - Initialization
    public init() {
        array = []
    }

    // MARK: - Methods
    public func push(_ element: T) {
        array.append(element)
    }

    @discardableResult
    public func pop() -> T? {
        return array.popLast()
    }

    public func peek() -> T? {
        return array.last
    }

    public func removeAll() {
        array.removeAll()
    }

}

public extension BASStack {
    func toString() -> String {
        var value: String = .Empty
        for item in array {
            value.append("\(item)\n")
        }

        value.removeLast()
        return value
    }
}
