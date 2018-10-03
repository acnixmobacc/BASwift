//
//  CustomFormViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 8.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import UIKit

class CustomFormViewController: BaseViewController {

    // MARK: - Properties
    weak var coordinatorDelegate: LoginCoordinatorDelegate?

    lazy var keyboardManager: KeyboardManager = {
        let instance = KeyboardManager(withScrollView: formManager.formView.scrollView)
        return instance
    }()

    lazy var formManager: FormManager = {
        let instance = FormManager(withView: self.view)
        instance.delegate = self
        return instance
    }()

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formManager.setupFormPage()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keyboardManager.startObservingKeyboard()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardManager.stopObservingKeyboard()
    }

}

extension CustomFormViewController: FormManagerDelegate {
    func onDone(error: ValidationResultProtocol?) {
        if let validationResult = error {
            showAlert(with: BaseAlert(message: validationResult.errorMessage, title: "Validation Error", handler: nil))
        }
    }

}
