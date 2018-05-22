//
//  Brand.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import SwiftyJSON

class BrandObject : IEntity{
    var brands : [Brand]
    
    required init(withData data: JSON) {
        brands = data["brands"].arrayValue.map{ item in
            return Brand.init(withData: item)
        }
    }
}

class BrandList: IEntity{
    var list: [Brand]
    
    required init(withData data: JSON) {
        list = data.arrayValue.map{item in
            return Brand.init(withData: item)
        }
    }
}

class Brand : IEntity{
    var id : String
    var name : String
    var logoURL : String
    
    required init(withData data: JSON) {
        self.id = data["id"].stringValue
        self.name = data["name"].stringValue
        self.logoURL = data["logo"].stringValue
    }
}
