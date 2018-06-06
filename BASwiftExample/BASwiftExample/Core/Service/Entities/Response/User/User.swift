//
//  User.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

public class User: Codable {
    var username: String
    var surname: String
    var tckn: String
    var favouriteBrands: [Brand]

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
