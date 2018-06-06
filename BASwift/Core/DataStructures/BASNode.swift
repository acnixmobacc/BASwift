//  IXNode.swift
//
//  Created by Burak Akkaya on 25/09/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class BASNode<T> {
    // MARK: - Properties
    public var value: T

    weak var parent: BASNode?

    public var children: [BASNode] = []

    // MARK: - Initialization
    public init(value: T) {
        self.value = value
    }

    // MARK: - Methods
    public func add(child: BASNode) {
        children.append(child)
        child.parent = self
    }
}

// MARK: - Search
extension BASNode: Equatable where T: Equatable {
    public static func == (lhs: BASNode<T>, rhs: BASNode<T>) -> Bool {
        return lhs.value == rhs.value
    }

    func search(value: T) -> BASNode<T>? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }

    func contains(node: BASNode<T>) -> Bool {
        if(self == node) {
            return true
        }

        for child in children {
            if child.contains(node: node) {
                return true
            }
        }
        return false
    }
}
