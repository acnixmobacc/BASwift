//
//  SwitchFormItemView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 10.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class SwitchFormItemView: UIView, IFormItemView {

    // MARK: - Properties
    var value: Any? {
        return switchButton.isOn
    }

    // MARK: - UI Fields
    @IBOutlet weak private var switchButton: UISwitch!

    // MARK: - Block
    var onChange: ((Any?) -> Void)?

    // MARK: - Action Methods
    @IBAction func switchButtonAction(_ sender: UISwitch) {
        guard let onChange = onChange else {
            return
        }
        onChange(sender.isOn)
    }

}
