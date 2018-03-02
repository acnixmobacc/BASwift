//
//  UIViewController+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 25/03/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UIViewController {

    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    func setBackgroundColor(fromImage image: UIImage) {
        self.view.backgroundColor = UIColor(patternImage: image)
    }

}
