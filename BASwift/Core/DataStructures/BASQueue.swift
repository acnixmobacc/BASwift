//
//  IXQueue.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 07/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class BASQueue<T> {

    // MARK: - Properties
    fileprivate var list: BASLinkedList<T>

    public var isEmpty: Bool {
        return list.isEmpty
    }

    // MARK: - Initialization
    public init() {
        list = BASLinkedList()
    }

    // MARK: - Methods
    public func enqueue(_ element: T) {
        list.append(value: element)
    }

    @discardableResult
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }

        _ = list.remove(node: element)

        return element.value
    }

    public func peek() -> T? {
        guard let firstElement = list.first else {
            return nil
        }
        return firstElement.value
    }
}

// MARK: - Custom String Convertible
extension BASQueue: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}
