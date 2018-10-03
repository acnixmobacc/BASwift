//
//  PickerTextFieldItemView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 9.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class PickerFormItemView: UIView, IFormItemView {

    // MARK: - Properties
    fileprivate let cities = ["İstanbul", "Trabzon", "İzmir", "Ankara", "Artvin", "Mardin", "Diyarbakır"]

    var validationRules: [ValidationRuleProtocol]?

    // MARK: - Block
    var didChange: ((Any?) -> Void)?

    // MARK: - UI Fields
    @IBOutlet weak private var pickerField: PickerTextField!

    // MARK: - UI Methods
    func setupUI(placeholder: String) {
        pickerField.placeholder = placeholder
        pickerField.setPickerView(withData: cities)
        pickerField.pickerDelegate = self
    }

}

extension PickerFormItemView: PickerTextFieldDelegate {
    func onSelect(value: String) {
        guard let onChange = self.onChange else { return }
        onChange(value)
    }

    func didSelect(value: String) {
        guard let didChange = self.didChange else { return }
        didChange(value)
    }

    func didCancel(value: String) {
        guard let didCancel = self.didCancel else { return }
        didCancel(value)
    }

}
