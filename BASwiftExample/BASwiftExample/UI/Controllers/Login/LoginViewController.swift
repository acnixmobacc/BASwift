//
//  LoginViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class LoginViewController : BABaseViewController<LoginViewModel>{
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    lazy var touchIDManager : TouchIDManager = {
        return TouchIDManager()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        touchIDManager.authenticateUser(reasonText: "Test", successBlock: {[weak self] result in
            self?.dismiss(animated: true, completion: nil)
        }) {[weak self] error in
            self?.showAlert(BaseAlert.init(message: error.localizedDescription))
        }
    }
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
