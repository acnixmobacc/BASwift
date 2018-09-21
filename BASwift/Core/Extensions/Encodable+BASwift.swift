//
//  Encodable+BASwift.swift
//  BASwift
//
//  Created by Burak Akkaya on 21.09.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
