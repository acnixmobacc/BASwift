//
//  IXTree.swift
//  IXCommonFramework
//
//  Created by Burak Akkaya on 14/11/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class BASTree<T> {
    // MARK: - Properties
    fileprivate var rootObject: BASNode<T>?

    public var isEmpty: Bool {
        return rootObject == nil
    }

    // MARK: - Initialization
    public init() {
        rootObject = nil
    }

    public init(withRootValue value: T) {
        rootObject = BASNode(value: value)
    }

    public init(withRootNode node: BASNode<T>) {
        rootObject = node
    }

    // MARK: - Methods
    public func addRoot(value: T) {
        rootObject = BASNode(value: value)
    }

    public func addRoot(node: BASNode<T>) {
        rootObject = node
    }

    public func add(value: T, toNode: BASNode<T>) {
        guard let _ = rootObject else {
            fatalError("Cannot add new node to tree when root object is null")
        }

        toNode.add(child: BASNode(value: value))
    }

    public func add(node: BASNode<T>, toNode: BASNode<T>) {
        guard let _ = rootObject else {
            fatalError("Cannot add new node to tree when root object is null")
        }
        toNode.add(child: node)
    }
}

// MARK: - Add & Search
public extension BASTree where T: Equatable {

    func add(value: T, toValue: T) {
        if let node = search(value: toValue) {
            add(value: value, toNode: node)
        } else {
            print("Doesn't have any node to value: \(value)")
        }
    }

    func search(value: T) -> BASNode<T>? {
        if let rootObject = self.rootObject {
            return rootObject.search(value: value)
        }

        return nil
    }

    func contains(node: BASNode<T>) -> Bool {
        if let rootObject = self.rootObject {
            return rootObject.contains(node: node)
        }

        return false
    }

}
