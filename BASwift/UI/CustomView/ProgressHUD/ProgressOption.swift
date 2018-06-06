//
//  ProgressOption.swift
//  BASwift
//
//  Created by Burak Akkaya on 13.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class ProgressOptions {
    // MARK: - Properties
    var frame: CGRect

    var showTransparentView: Bool

    // MARK: - Initialization
    init(withFrame frame: CGRect = CGRect(x: 100, y: 100, width: 100, height: 100),
         showTransparentView: Bool = true) {
        self.frame = frame
        self.showTransparentView = showTransparentView
    }

    // MARK: - Default Value
    static let `default`: ProgressOptions = {
        return ProgressOptions()
    }()
}
