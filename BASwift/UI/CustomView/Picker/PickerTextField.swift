//
//  PickerTextField.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 03/04/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class PickerTextField: BaseTextField {

    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        self.rightViewMode = .always
    }

}
