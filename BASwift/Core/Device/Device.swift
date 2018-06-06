//
//  DeviceProperties.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 01/11/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public struct Device {
    public struct Screen {
    }
}
internal protocol EnumProtocol: Hashable {
    /// -returns: All Enum Values
    static var all: [Self] { get }
}

internal extension EnumProtocol {
    static var all: [Self] {
        typealias Type = Self
        let cases = AnySequence { () -> AnyIterator<Type> in
            var raw = 0
            return AnyIterator {
                let current: Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: Type.self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else { return nil }
                raw += 1
                return current
            }
        }
        return Array(cases)
    }
}
