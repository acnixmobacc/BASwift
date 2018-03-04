//  IXNode.swift
//
//  Created by Burak Akkaya on 25/09/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class BASNode<T> {

    public var value: T
    weak var parent: BASNode?

    public var children: [BASNode] = []

    public init(value: T) {
        self.value = value
    }

    public func add(child: BASNode) {
        children.append(child)
        child.parent = self
    }
}

public extension BASNode where T: Equatable {

    func search(value: T) -> BASNode? {
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
}
