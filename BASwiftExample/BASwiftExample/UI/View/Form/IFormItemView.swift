//
//  IFormItemView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 8.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol IFormItemView {
    var height: CGFloat { get }

    var onValidation: (() -> Void)? { get set }

    var onClick:(() -> Void)? { get set }
}
