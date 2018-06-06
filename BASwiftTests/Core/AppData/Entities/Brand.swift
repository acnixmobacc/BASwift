//
//  Brand.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import SwiftyJSON

class BrandObject : Decodable{
    var brands : [Brand]
}

class BrandList: Decodable{
    var list: [Brand]
    
    required init(from decoder:Decoder) throws{
        var brands : [Brand] = []
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            brands.append(try container.decode(Brand.self))
        }
        self.list = brands
    }
}

class Brand : Decodable{
    var id : String
    var name : String
    var logo : String

}
