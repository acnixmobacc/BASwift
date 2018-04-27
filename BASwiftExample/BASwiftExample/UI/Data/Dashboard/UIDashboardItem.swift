//
//  UIDashboardItem.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
enum DashboardItemType: String {
    case progress = "Progress"
    case picker = "Picker"
    case collection = "Collection Adapter"
    case table = "Table Adapter"
    case location = "Location Manager"
    case login = "Login"
    case form = "Form"
}

class UIDashboardItem: ICellData {

    var type: DashboardItemType

    var title: String {
        return type.rawValue
    }

    init(withType type: DashboardItemType) {
        self.type = type
    }
}
