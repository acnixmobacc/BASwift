//
//  User.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import SwiftyJSON

public class User: IEntity {
    var username: String
    var surname: String
    var tckn: String
    var favouriteBrands: [Brand]

    required public init(withData data: JSON) {
        self.username = data["username"].stringValue
        self.surname = data["surname"].stringValue
        self.tckn = data["tckn"].stringValue
        self.favouriteBrands = data["favouriteBrands"].arrayValue.map { item in
            return Brand(withData: item)
        }
    }

    init(username: String = "", surname: String = "", tckn: String = "", favouriteBrands: [Brand] = []) {
        self.username = username
        self.surname = surname
        self.tckn = tckn
        self.favouriteBrands = favouriteBrands
    }

    func isEmpty() -> Bool {
        return tckn.isEmpty
    }

    static func emptyUser() -> User {
        return User()
    }
}
