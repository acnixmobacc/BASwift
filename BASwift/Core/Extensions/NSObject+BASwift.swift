//
//  NSObject+BASwift.swift
//  BASwift
//
//  Created by Burak Akkaya on 28.08.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

extension NSObject {
    // MARK: - Static Properties
    @objc class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
