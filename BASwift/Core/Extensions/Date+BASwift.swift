//
//  Date+IXBase .swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 10/02/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension Date {

    // MARK: - Formats
    public static var dd_mm_yyyy: String = "dd.MM.yyyy"
    public static var dd_mm_yyyy_hh_mm: String = "dd.MM.yyyy HH:mm"
    public static var dd_mm_yyyy_hh_mm_ss: String = "dd.MM.yyyy HH:mm:ss"
    public static var mm_yyyy: String = "MM.yyyy"
    public static var mm_yy: String = "MM/yy"

    // MARK: - Initialization
    init(fromText text: String, withFormat format: String) {
        let dateFormatter = Date.createFormatter(withDateFormat: format)
        let d = dateFormatter.date(from: text)!
        self = Date(timeInterval: 0, since: d)
    }

    // MARK: - Methods
    public func formattedText(withFormat format: String = Date.dd_mm_yyyy) -> String {
        let formatter = Date.createFormatter(withDateFormat: format)
        return formatter.string(from: self)
    }

    // MARK: - Private Methods
    fileprivate static func createFormatter(withDateFormat dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter
    }

}
