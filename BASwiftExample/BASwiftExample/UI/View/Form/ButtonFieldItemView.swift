//
//  ButtonFieldItemView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 8.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class ButtonFieldItemView: UIView, IFormItemView {

    var onValidation: (() -> Void)?

    var onClick: (() -> Void)?

    var height: CGFloat = 120.0

    @IBAction func action(_ sender: Any) {
        guard let onClick = onClick else {
            return
        }
        onClick()
    }
}
