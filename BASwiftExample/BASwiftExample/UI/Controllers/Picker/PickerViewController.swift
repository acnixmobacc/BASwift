//
//  PickerViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class PickerViewController: BaseViewController<PickerViewModel> {

    @IBOutlet weak private var pickerField: PickerTextField!

    @IBOutlet weak private var datePickerField: DatePickerTextField!

    weak var coordinatorDelegate: DashboardCoordinatorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerField.setPickerView(withPicker: Picker(dataArray: ["Trabzonspor", "Man Utd", "Catamara FC", "Milan", "Real Madrid", "Barcelona"]))

        datePickerField.setDatePickerView(withPicker: DatePicker(minimumDate: Date(fromText: "20.04.2018", withFormat: Date.dd_mm_yyyy),
                                                                 maximumDate: Date(fromText: "20.05.2018", withFormat: Date.dd_mm_yyyy)))

    }

}
