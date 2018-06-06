//
//  UIView+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 25/03/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UIView {

    // MARK: - Inspectable Variables
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0

        }
    }

    // MARK: - Static Properties
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

}
