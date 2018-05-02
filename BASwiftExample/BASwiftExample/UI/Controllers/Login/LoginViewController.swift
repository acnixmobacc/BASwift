//
//  LoginViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//
import BASwift
import RxCocoa
import RxSwift

class LoginViewController: BaseViewController<LoginViewModel> {

    // MARK: - UI Fields
    @IBOutlet weak private var usernameField: UITextField!

    @IBOutlet weak private var passwordField: UITextField!

    @IBOutlet weak private var loginButton: UIButton!

    @IBOutlet weak private var registerButton: UIButton!

    // MARK: - Properties
    weak var coordinatorDelegate: LoginCoordinatorDelegate?

    lazy var touchIDManager: TouchIDManager = {
        return TouchIDManager()
    }()

    var disposeBag: DisposeBag = DisposeBag()

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIBindings()
    }

    // MARK: - Private Methods
    private func setUIBindings() {
        registerButton.rx.tap.bind(onNext: { [weak self] in
            self?.coordinatorDelegate?.showRegister()
        }).disposed(by: disposeBag)

        loginButton.rx.tap.bind(onNext: { [weak self] in
            self?.authenticateWithTouchID()
        }).disposed(by: disposeBag)

    }

    func authenticateWithTouchID() {
        touchIDManager.authenticateUser(reasonText: "Test", successBlock: {[weak self] _ in
            self?.coordinatorDelegate?.dismiss()
        }, errorBlock: {[weak self] error in
            self?.showAlert(BaseAlert(message: error.localizedDescription))
        })
    }

}
