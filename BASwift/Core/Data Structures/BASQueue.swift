//
//  IXQueue.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 07/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class BASQueue<T> {

    fileprivate var list: BASLinkedList<T>

    public var isEmpty: Bool {
        return list.isEmpty
    }

    init() {
        list = BASLinkedList()
    }

    public func enqueue(_ element: T) {
        list.append(value: element)
    }

    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }

        _ = list.remove(node: element)

        return element.value
    }

    public func peek() -> T? {
        return list.first?.value
    }
}

extension BASQueue: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}
