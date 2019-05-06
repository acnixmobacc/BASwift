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
    open weak var delegate: PickerDelegate?

    var dateFormat: String

    open var pickerView: UIDatePicker! {
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

    open var value: String {
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

    public init(withDateFormat dateFormat: String = "dd.MM.yyyy", minimumDate: Date? = nil, maximumDate: Date? = nil) {
        self.dateFormat = dateFormat
        super.init()
        setPicker()
        setAvailableDateRange(minimumDate: minimumDate, maximumDate: maximumDate)
    }

    // MARK: - Methods
    private func setPicker() {
        pickerView.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }

    public func setAvailableDateRange(minimumDate: Date? = nil, maximumDate: Date? = nil) {
        pickerView.minimumDate = minimumDate
        pickerView.maximumDate = maximumDate
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
