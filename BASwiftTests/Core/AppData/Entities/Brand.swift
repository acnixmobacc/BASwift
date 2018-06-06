//
//  Brand.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import Foundation

class BrandObject : Codable{
    var brands : [Brand] = []
}

class BrandList: Codable{
    var list: [Brand]
    
    required init(from decoder:Decoder) throws{
        self.list = try JSONDecoder.toArray(from: decoder)
    }
}

class Brand : Codable{
    var id : String = ""
    var name : String = ""
    var logo : String = ""

}

class User : Codable{
    var username:String = ""
    var surname:String = ""
    var tckn:String = ""
    var favouriteBrands : [Brand] = []
}

class CarDetail: Codable{
    var id:String = ""
    var brandName:String = ""
    var name:String = ""
    var logoURL:String = ""
    
    
    private enum CodingKeys: String, CodingKey{
        case id
        case brandName = "brand_name"
        case name
        case logoURL = "logo"
    }
}


