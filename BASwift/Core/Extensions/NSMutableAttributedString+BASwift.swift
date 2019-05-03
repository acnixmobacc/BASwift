//
//  NSMutableAttributedString+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 04/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension NSMutableAttributedString {

    // MARK: - Methods
    @discardableResult
    func bold(_ text: String, size: CGFloat, font: UIFont) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: AnyObject] = [NSAttributedString.Key.font: font]
        let boldString = NSMutableAttributedString(string: "\(text)", attributes: attrs)
        self.append(boldString)
        return self
    }

    @discardableResult
    func normal(_ text: String, size: CGFloat, font: UIFont) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: AnyObject] = [NSAttributedString.Key.font: font]
        let normal = NSMutableAttributedString(string: "\(text)", attributes: attrs)
        self.append(normal)
        return self
    }
}
