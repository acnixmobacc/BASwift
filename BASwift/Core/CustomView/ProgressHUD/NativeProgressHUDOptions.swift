//
//  NativeProgressOption.swift
//  BASwift
//
//  Created by Burak Akkaya on 13.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class NativeProgressHUDOptions: ProgressHUDOptions {

    // MARK: - Properties
    var style: UIActivityIndicatorViewStyle

    // MARK: - Initialization
    init(withFrame frame: CGRect = CGRect(x: 100, y: 100, width: 100, height: 100),
         withStyle style: UIActivityIndicatorViewStyle = .white) {
        self.style = style
        super.init(withFrame: frame)
    }

    // MARK: - Default Value
    static let `nativeDefault`: ProgressHUDOptions = {
        return NativeProgressHUDOptions()
    }()

}
