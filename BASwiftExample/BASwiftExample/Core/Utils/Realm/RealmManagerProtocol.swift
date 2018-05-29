//
//  RealmManagerProtocol.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import RealmSwift

public protocol RealmManagerProtocol {

    func open(withConfig config: Realm.Configuration)

    func find<T: Object>(type: T.Type, query: String) -> T?

    func get<T: Object>(type: T.Type) -> T?

    func get<T: Object>(type: T.Type, defaultObj: T) -> T

    func add<T: Object>(object: T)

    func remove<T: Object>(object: T)

}
