//
//  Brand.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import SwiftyJSON

class Brand: IEntity {
    var id: String
    var name: String
    var logoURL: String

    required init(withData data: JSON) {
        self.id = data["id"].stringValue
        self.name = data["name"].stringValue
        self.logoURL = data["logo"].stringValue
    }
}
