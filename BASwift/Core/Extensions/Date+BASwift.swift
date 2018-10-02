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
    public static var eeee_mmm_d_yyyy: String = "EEEE, MMM d, yyyy"
    public static var e_d_mmm_yyyy_hh_mm_ss_z: String = "E, d MMM yyyy HH:mm:ss Z"
    public static var yyyy_mm_dd_t_hh_mm_ss_z: String = "yyyy-MM-dd'T'HH:mm:ssZ"

    // MARK: - Initialization
    init?(fromText text: String, withFormat format: String) {
        let dateFormatter = Date.createFormatter(withDateFormat: format)
        guard let date = dateFormatter.date(from: text) else {
            return nil
        }

        self = Date(timeInterval: 0, since: date)
    }

    // MARK: - Methods
    public func formattedText(withFormat format: String = Date.dd_mm_yyyy) -> String {
        let formatter = Date.createFormatter(withDateFormat: format)
        return formatter.string(from: self)
    }

    // MARK: - Compenents
    func getYear() -> Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: self)
    }

    func getMonth() -> Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: self)
    }

    func getDay() -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: self)
    }

    func getMonthAsMMMFormat() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MMM")
        return df.string(from: self)
    }

    // MARK: - Private Methods
    fileprivate static func createFormatter(withDateFormat dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter
    }

}
