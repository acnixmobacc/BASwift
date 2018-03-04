//
//  String+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 06/04/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension String {
    var length: Int {
        return self.count
    }

    var toInt: Int {
        return Int(self)!
    }

    static var Empty: String {
        return ""
    }

    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }

    func replace(_ string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }

    func substring(from: Int = 0, to: Int) -> String {
        if (from > self.length || to > self.length || from > to) {
            return ""
        }
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)

        return String(self[startIndex..<endIndex])
    }

    func contains(find: String, ignoreCase: Bool = false) -> Bool {
        return ignoreCase ? self.range(of: find, options: .caseInsensitive) != nil : self.range(of: find) != nil
    }

    func isDecimal() -> Bool {
        return self.rangeOfCharacter(from: NSCharacterSet.decimalDigits.inverted,
                                     options: String.CompareOptions.caseInsensitive) == nil
    }

    func isNumber() -> Bool {
        let aSet = NSCharacterSet(charactersIn: "0123456789").inverted
        let compSepByCharInSet = self.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return self == numberFiltered
    }

}