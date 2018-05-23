//
//  BrandList.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import SwiftyJSON

public class BrandList: IEntity {
    var list: [Brand]

    required public init(withData data: JSON) {
        list = data["brands"].arrayValue.map {item in
            return Brand(withData: item)
        }
    }
}
