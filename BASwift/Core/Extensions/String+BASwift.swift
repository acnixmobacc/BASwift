//
//  String+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 06/04/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension String {

    // MARK: - Properties
    var toInt: Int {
        return Int(self)!
    }

    var shouldEmpty: Bool {
        let trimmedText = self.removeWhitespace()
        return trimmedText.isEmpty
    }

    var isDecimal: Bool {
        return self.rangeOfCharacter(from: NSCharacterSet.decimalDigits.inverted,
                                     options: String.CompareOptions.caseInsensitive) == nil
    }

    static var Empty: String {
        return ""
    }

    // MARK: - Methods
    func isMatch(regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }

    func replace(_ string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }

    func substring(from: Int = 0, to: Int? = nil) -> String {
        var toIndex = self.count

        if let to = to {
            toIndex = to
        }

        if (from > self.count || toIndex > self.count || from > toIndex) {
            return ""
        }
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: toIndex)

        return String(self[startIndex..<endIndex])
    }

    func contains(find: String, ignoreCase: Bool = false) -> Bool {
        return ignoreCase ? self.range(of: find, options: .caseInsensitive) != nil : self.range(of: find) != nil
    }

}
