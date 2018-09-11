//
//  Picker.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 03/04/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

// MARK: - Picker Delegate
public protocol PickerDelegate: class {
    func onSelectItem(value: String)
}

// MARK: - Picker
open class Picker: NSObject {

    // MARK: - Private Methods
    private var _pickerView: UIPickerView!

    // MARK: - Properties
    var data: [String]!

    var lastSelectedRow: Int?

    var pickerView: UIPickerView! {
        get {
            if _pickerView == nil {
                self._pickerView = UIPickerView()
            }

            return _pickerView
        }

        set(value) {
            _pickerView = value
            _pickerView.delegate = self
            _pickerView.dataSource = self
            _pickerView.showsSelectionIndicator = true
        }
    }

    weak var delegate: PickerDelegate?

    // MARK: - Initialization
    public init(dataArray: [String], selectedItem: String? = nil) {
        super.init()
        self.pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        self.data = dataArray

        if let selectedItem = selectedItem {
            lastSelectedRow = self.data.index(of: selectedItem)
        } else {
            lastSelectedRow = nil
        }
    }

    // MARK: - Methods
    public func onClickDone(_ textField: PickerTextField) {
        if (textField.text?.count == 0) {
            self.pickerView.selectRow(0, inComponent: 0, animated: false)
            self.pickerView(self.pickerView, didSelectRow: 0, inComponent: 0)
            lastSelectedRow = 0
        }
        if (data.count != 0 && data != nil && textField.text?.count != 0) {
            lastSelectedRow = data.index(of: textField.text!)!
        }
    }

    public func onClickCancel(_ textField: PickerTextField) {
        if let selectedRow = lastSelectedRow {
            pickerView.selectRow(selectedRow, inComponent: 0, animated: true)
            textField.text = data[selectedRow]
        } else {
            textField.text = .Empty
        }
    }

}

// MARK: - UIPickerViewDataSource
extension Picker: UIPickerViewDataSource {

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

// MARK: - UIPickerViewDelegate
extension Picker: UIPickerViewDelegate {

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if data.count != 0 && data != nil {
            return data[row]
        }
        return .Empty
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if data.count != 0 && data != nil {
            delegate?.onSelectItem(value: data[row])
        }
    }

}
