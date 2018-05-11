//
//  CustomFormViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 8.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import UIKit

class CustomFormViewController: BaseViewController<FormViewModel> {

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
    func onDone(errorStack: BASStack<String>) {
        if !errorStack.isEmpty {
            alertManager.showAlert(withAlert: BaseAlert(message: errorStack.toString(), title: "Validation Error", handler: nil))
        }
    }
}
