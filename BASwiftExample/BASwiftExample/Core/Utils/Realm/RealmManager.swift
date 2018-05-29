//
//  RealmConfigurationManager.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Realm
import RealmSwift

class RealmManager: RealmManagerProtocol {

    private var realm: Realm?

    func open(withConfig config: Realm.Configuration = Realm.Configuration.defaultConfiguration) {
        do {
            realm = try Realm(configuration: config)
        } catch {
            Logger.error("Realm could not be initialized")
        }
    }

    func find<T>(type: T.Type, query: String) -> T? where T: Object {
        guard let realm = self.realm else { return nil }
        // swiftlint:disable first_where
        return realm.objects(type).filter(query).first
        // swiftlint:enable first_where
    }

    func get<T>(type: T.Type) -> T? where T: Object {
        guard let realm = self.realm else { return nil }
        return realm.objects(type).first
    }

    func get<T>(type: T.Type, defaultObj: T) -> T where T: Object {
        guard let realm = self.realm else { return defaultObj }

        guard let returnData = realm.objects(type).first else {
            return defaultObj
        }

        return returnData
    }

    func add<T>(object: T) where T: Object {
        guard let realm = self.realm else { return }
        realm.add(object)
    }

    func remove<T>(object: T) where T: Object {
        guard let realm = self.realm else { return }
        realm.delete(object)
    }
}
