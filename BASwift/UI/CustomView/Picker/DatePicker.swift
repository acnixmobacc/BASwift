//
//  DatePicker.swift
//  BASwift
//
//  Created by Burak Akkaya on 27.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class DatePicker: NSObject {

    // MARK: - Private Methods
    private var _pickerView: UIDatePicker!

    // MARK: - Properties
    weak var delegate: PickerDelegate?

    var dateFormat: String

    var pickerView: UIDatePicker! {
        get {
            if _pickerView == nil {
                _pickerView = UIDatePicker()
                _pickerView.datePickerMode = .date
            }

            return _pickerView
        }

        set(value) {
            _pickerView = value
        }
    }

    var lastSelectedDate: Date?

    var value: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = self.dateFormat
            return dateFormatter.string(from: pickerView.date)
        }
    }

    // MARK: - Initialization
    public init(withDateFormat dateFormat: String = "dd.MM.yyyy") {
        self.dateFormat = dateFormat
        super.init()
        setPicker()

    }

    // MARK: - Methods
    private func setPicker() {
        pickerView.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }

    @objc
    func datePickerValueChanged(_ sender: UIDatePicker) {
        delegate?.onSelectItem(value: value)
    }

    public func onClickDone(_ textField: DatePickerTextField) {
        textField.text = value
        lastSelectedDate = pickerView.date
    }

    public func onClickCancel(_ textField: DatePickerTextField) {
        if let lastSelectedDate = self.lastSelectedDate {
            pickerView.setDate(lastSelectedDate, animated: true)
            textField.text = value
        } else {
            textField.text = .Empty
        }
    }
}
