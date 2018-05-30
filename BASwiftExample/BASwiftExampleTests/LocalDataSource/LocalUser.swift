//
//  LocalUser.swift
//  BASwiftExampleTests
//
//  Created by Burak Akkaya on 29.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import RealmSwift

class LocalUser : Object{

    @objc dynamic var name : String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var tckn: String = ""
    
}
