//
//  LocalUserProvider.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 23.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class LocalUserDataProvider {

    private(set) var user: User

    init() {
        user = User.emptyUser()
    }

    func putUser(user: User) {
        self.user = user
    }

    func addFavouriteBrand(brand: Brand) {
        user.favouriteBrands.append(brand)
    }

}
