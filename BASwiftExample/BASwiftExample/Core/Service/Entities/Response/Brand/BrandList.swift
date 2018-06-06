//
//  BrandList.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

public class BrandList: Codable {
    var list: [Brand]

    public required init(from decoder: Decoder) throws {
        list = try JSONDecoder.toArray(from: decoder)
    }
}
