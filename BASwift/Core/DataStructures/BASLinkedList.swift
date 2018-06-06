//
//  IXLinkedList.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 09/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

// MARK: - Linked Node
open class BASLinkedNode<T> {
    // MARK: - Properties
    public var value: T

    public var next: BASLinkedNode<T>?

    weak public var previous: BASLinkedNode<T>?

    // MARK: - Initialization
    public init(value: T) {
        self.value = value
    }

}

// MARK: - Linked List
open class BASLinkedList<T> {
    // MARK: - Properties
    fileprivate var head: BASLinkedNode<T>?

    private var tail: BASLinkedNode<T>?

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: BASLinkedNode<T>? {
        return head
    }

    public var last: BASLinkedNode<T>? {
        return tail
    }

    // MARK: - Initialization
    public init() {
        head = nil
        tail = nil
    }

    // MARK: - Methods
    public func append(value: T) {
        let newNode = BASLinkedNode(value: value)

        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }

        tail = newNode
    }

    public func append(newNode: BASLinkedNode<T>) {
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }

        tail = newNode
    }

    public func node(atIndex index: Int) -> BASLinkedNode<T>? {
        if index >= 0 {
            var node = head
            var i = index

            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }

        }

        return nil
    }

    public func removeAll() {
        head = nil
        tail = nil
    }

    @discardableResult
    public func remove(node: BASLinkedNode<T>) -> T? {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev

        if next == nil {
            tail = prev
        }

        node.previous = nil
        node.next = nil

        return node.value
    }
}

// MARK: - Custom String Convertible
extension BASLinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head

        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}
