//
//  PickerViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class PickerViewController : BA_BaseViewController<PickerViewModel>{
    
    @IBOutlet weak var pickerField: PickerTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pickerField.setPickerView(withPicker: Picker(dataArray: ["Trabzonspor", "Man Utd", "Catamara FC", "Milan", "Real Madrid", "Barcelona"]))
        
    }
    
}
