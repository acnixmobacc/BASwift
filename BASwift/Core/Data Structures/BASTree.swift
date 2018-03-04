//
//  IXTree.swift
//  IXCommonFramework
//
//  Created by Burak Akkaya on 14/11/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class BASTree<T> {
    public var rootObject: BASNode<T>

    public init(withRootValue value: T) {
        rootObject = BASNode(value: value)
    }

    public func add(value: T, toNode: BASNode<T>) {
        toNode.add(child: BASNode(value: value))
    }
}

public extension BASTree where T:Equatable {
    func add(value: T, toValue: T) {
        if let node = search(value: toValue) {
            add(value: value, toNode: node)
        } else {
            print("Doesn't have any node to value: \(value)")
        }
    }

    func search(value: T) -> BASNode<T>? {
        return rootObject.search(value: value)
    }

}