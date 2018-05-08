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

    lazy var usernameItem = {
      return TextFieldItemView.fromNib()
    }()

    lazy var buttonItem = {
        return ButtonFieldItemView.fromNib()
    }()

    lazy var formView = {
        return FormView(frame: self.view.frame)
    }()

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addFormView()
    }

}

// MARK: - Private Methods
extension CustomFormViewController {
    private func addFormView() {
        view.addSubview(self.formView)

        usernameItem.onValidation = { [weak self]  in
            guard let strongSelf = self else { return }
            strongSelf.usernameItem.setErrorView()
        }

        self.formView.add(usernameItem)

        buttonItem = ButtonFieldItemView.fromNib()

        buttonItem.onClick = {[weak self] in
            guard let strongSelf = self else { return }
            strongSelf.formView.validate()
        }

        self.formView.add(buttonItem)

    }
}
