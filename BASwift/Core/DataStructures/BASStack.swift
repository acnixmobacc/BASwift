//
//  IXStack.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 07/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class BASStack<T> {

    //MARK: - Properties
    fileprivate var array: [T]

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    //MARK: - Initialization
    init() {
        array = []
    }

    //MARK: - Methods
    public func push(_ element: T) {
        array.append(element)
    }

    public func pop() -> T? {
        return array.popLast()
    }

    public func peek() -> T? {
        return array.last
    }

}
