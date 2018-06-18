//
//  UIDashboardItem.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

enum AppStoryboard: String {
    case main = "Main"
    case login = "Login"
    case adapter = "Adapter"
    case product = "Product"
    case disney = "Disney"

    var name: String {
        return self.rawValue
    }
}

enum DashboardItemType: String {
    case progress = "Progress"
    case picker = "Picker"
    case collection = "Collection Adapter"
    case table = "Table Adapter"
    case location = "Location Manager"
    case login = "Login"
    case form = "Form"
    case customForm = "CustomForm"
    case disney = "Disney"
}

class UIDashboardItem: NSObject {

    var type: DashboardItemType

    var title: String {
        return type.rawValue
    }

    init(withType type: DashboardItemType) {
        self.type = type
    }
}
