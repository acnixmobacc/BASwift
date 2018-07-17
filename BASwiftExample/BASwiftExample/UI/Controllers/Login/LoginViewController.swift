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

class CustomAlert: BaseAlert {
    var cancelHandler: ((Any) -> Void)?

    init(message: String, title: String, handler: ((Any) -> Void)?, cancelHandler: ((Any) -> Void)?) {
        self.cancelHandler = cancelHandler
        super.init(message: message, title: title, handler: handler)
    }
}
class CustomAlertView: IAlertView {
    func show(vc: UIViewController, alert: IAlert) {

        let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: alert.handler))
        if let alert = alert as? CustomAlert {
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: alert.cancelHandler))
        }

        vc.present(alertController, animated: true, completion: nil)
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

    override lazy var alertManager: IAlertManager = {
        return AlertViewManager(alertView: CustomAlertView(), with: self)
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

            strongSelf.showDialog()
            //strongSelf.coordinatorDelegate?.showRegister()

        }).disposed(by: disposeBag)

        loginButton.rx.tap.bind(onNext: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.viewModel.login()
        }).disposed(by: disposeBag)

    }

    func showDialog() {
        alertManager.showAlert(withAlert: CustomAlert(message: "Message", title: "Title", handler: {_ in
            Logger.debug("Debug handler")
        }, cancelHandler: {_ in
            Logger.debug("Cancel handler")
        }))
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
