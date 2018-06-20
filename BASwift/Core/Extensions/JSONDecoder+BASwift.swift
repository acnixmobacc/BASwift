//
//  JSONDecoder+BASwift.swift
//  BASwift
//
//  Created by Burak Akkaya on 6.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

public extension JSONDecoder {
    static func toArray<T: Decodable>(from decoder: Decoder) throws -> [T] {
        var list: [T] = []
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            list.append(try container.decode(T.self))
        }
        return list
    }
}
