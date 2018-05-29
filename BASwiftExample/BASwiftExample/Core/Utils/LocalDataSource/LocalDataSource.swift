//
//  LocalDataSource.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 29.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import RealmSwift

class LocalDataSource<T: Object> {

    private var realmManager: RealmManagerProtocol

    init(manager: RealmManagerProtocol) {
        self.realmManager = manager
        self.realmManager.open(withConfig: Realm.Configuration.defaultConfiguration)
    }

    func get() -> T? {
        return realmManager.get(type: T.self)
    }

    func get(withDefault defaultObj: T) -> T {
        return realmManager.get(type: T.self, defaultObj: defaultObj)
    }

    func find(query: String) -> T? {
        return realmManager.find(type: T.self, query: query)
    }

    func add(object: T) {
        realmManager.add(object: object)
    }

    func remove(object: T) {
        realmManager.remove(object: object)
    }

}
