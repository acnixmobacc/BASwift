//
//  DatePickerFormItemView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 9.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class DatePickerFormItemView: UIView, IFormItemView {

    // MARK: - Block
    var didChange: ((Any?) -> Void)?

    // MARK: - UI Fields
    @IBOutlet weak private var datePickerField: DatePickerTextField!

    // MARK: - UI Methods

    func setupUI(placeholder: String) {
        datePickerField.placeholder = placeholder
        datePickerField.setDatePickerView()
        datePickerField.pickerDelegate = self
    }
}

extension DatePickerFormItemView: PickerTextFieldDelegate {
    func didSelect(value: String) {
        guard let didChange = self.didChange else { return }
        didChange(value)
    }

    func didCancel(value: String) {
        guard let didCancel = self.didCancel else { return }
        didCancel(value)
    }

    func onSelect(value: String) {
        guard let onChange = self.onChange else { return }
        onChange(value)
    }

}
