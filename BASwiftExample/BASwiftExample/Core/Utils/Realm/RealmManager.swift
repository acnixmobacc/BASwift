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
        let result = realm.objects(type).filter(query)
        return result.first
    }

    func get<T>(type: T.Type) -> T? where T: Object {
        guard let realm = self.realm else { return nil }
        return realm.objects(type).first
    }

    func getAll<T>(type: T.Type) -> [T] where T: Object {
        guard let realm = self.realm else { return [] }
        // swiftlint:disable array_init
        return realm.objects(type).map { $0 }
        // swiftlint:enable array_init
    }

    func get<T>(type: T.Type, defaultObj: T) -> T where T: Object {
        guard let realm = self.realm else { return defaultObj }

        guard let returnData = realm.objects(type).first else {
            return defaultObj
        }

        return returnData
    }

    @discardableResult
    func add<T>(object: T) -> Bool where T: Object {
        guard let realm = self.realm else { return false }

        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            Logger.error("Couldn't added to realm")
            return false
        }

        return true
    }

    @discardableResult
    func remove<T>(object: T) -> Bool where T: Object {
        guard let realm = self.realm else { return false }
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            Logger.error("Couldn't delete item from realm")
            return false
        }

        return true
    }

    @discardableResult
    func removeAll() -> Bool {
        guard let realm = self.realm else { return false }

        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            Logger.error("Realm write error")
            return false
        }

        return true
    }

    @discardableResult
    func remove<T>(type: T.Type) -> Bool where T: Object {
        guard let realm = self.realm else { return false }

        do {
            try realm.write {
                realm.delete(realm.objects(type))
            }
        } catch {
            Logger.error("Realm write error")
            return false
        }

        return true
    }

}
