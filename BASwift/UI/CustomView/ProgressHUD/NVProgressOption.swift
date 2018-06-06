//
//  NVProgressOption.swift
//  BASwift
//
//  Created by Burak Akkaya on 13.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import NVActivityIndicatorView
import UIKit

open class NVProgressOptions: ProgressOptions {
    // MARK: - Properties
    var type: NVActivityIndicatorType

    var userInteractionEnabled: Bool

    var color: UIColor

    // MARK: - Initialization
    init(withFrame frame: CGRect = CGRect(x: 0, y: 0, width: 60, height: 60),
         type: NVActivityIndicatorType = .ballGridPulse, color: UIColor = .white,
         userInteractionEnabled: Bool = true) {
        self.type = type
        self.color = color
        self.userInteractionEnabled = userInteractionEnabled
        super.init(withFrame: frame)
    }

    // MARK: - Default Value
    static let `nvProgressDefault`: ProgressOptions = {
        return NVProgressOptions()
    }()
}
