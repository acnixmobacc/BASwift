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

extension LoginViewController: LoginViewProtocol {

    func onLoginSucceed(user: User) {
        Logger.info("Login succeed")
    }

    func onLoginFailed() {
        Logger.info("Login failed")
    }

}

class LoginViewController: BaseViewController {

    // MARK: - UI Fields
    @IBOutlet weak private var usernameField: UITextField!

    @IBOutlet weak private var passwordField: UITextField!

    @IBOutlet weak private var loginButton: UIButton!

    @IBOutlet weak private var registerButton: UIButton!

    // MARK: - Properties
    var viewModel: LoginViewModelProtocol!

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
            guard let strongSelf = self else { return }
            strongSelf.coordinatorDelegate?.showRegister()
        }).disposed(by: disposeBag)

        loginButton.rx.tap.bind(onNext: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.viewModel.login()
        }).disposed(by: disposeBag)

    }

    func authenticateWithTouchID() {
        touchIDManager.authenticateUser(reasonText: "Test", successBlock: {[weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.coordinatorDelegate?.dismiss()
        }, errorBlock: {[weak self] error in
            guard let strongSelf = self else { return }
            strongSelf.showAlert(BaseAlert(message: error.localizedDescription))
        })
    }

}
