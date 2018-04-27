//
//  LoginViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//
import BASwift
import RxSwift
import RxCocoa

class LoginViewController : BaseViewController<LoginViewModel>{
    
    //MARK: - UI Fields
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    //MARK: - Properties
    weak var coordinatorDelegate : LoginCoordinatorDelegate?
    
    lazy var touchIDManager : TouchIDManager = {
        return TouchIDManager()
    }()
    
    var disposeBag : DisposeBag = DisposeBag()
    
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIBindings()
    }
    
    //MARK: - Private Methods
    private func setUIBindings(){
        registerButton.rx.tap.bind(onNext : { [weak self] in
            self?.coordinatorDelegate?.showRegister()
        }).disposed(by: disposeBag)
        
        loginButton.rx.tap.bind(onNext : { [weak self] in
            self?.authenticateWithTouchID()
        }).disposed(by: disposeBag)
        
        closeButton.rx.tap.bind(onNext : { [weak self] in
            self?.coordinatorDelegate?.dismiss()
        }).disposed(by: disposeBag)
    }
    
    func authenticateWithTouchID(){
        touchIDManager.authenticateUser(reasonText: "Test", successBlock: {[weak self] result in
            self?.dismiss(animated: true, completion: nil)
        }) {[weak self] error in
            self?.showAlert(BaseAlert.init(message: error.localizedDescription))
        }
    }

}
