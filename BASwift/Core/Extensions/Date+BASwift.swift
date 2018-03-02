//
//  Date+IXBase .swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 10/02/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension Date {
    init(fromText text: String, withFormat format: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        let d = dateFormatter.date(from: text)!
        self = Date(timeInterval: 0, since: d)
    }

    var defaultFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        formatter.locale = Locale(identifier: "tr-TR")
        return  formatter.string(from: self)
    }

    var chequeFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        formatter.locale = Locale(identifier: "tr-TR")
        return  formatter.string(from: self)
    }

}
