//
//  UIViewController+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 25/03/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UIViewController {

    // MARK: - Static Properties
    class var identifier: String {
        return className
    }

    func setBackgroundColor(fromImage image: UIImage) {
        self.view.backgroundColor = UIColor(patternImage: image)
    }

}
