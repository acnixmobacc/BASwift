//
//  ViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class ViewController: BA_BaseViewController<ViewModel> {

    @IBOutlet weak var childView: LoadableView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }


    @IBAction func showAlertAction(_ sender: Any) {
        showAlert(BaseAlert.init(message: "Change color", title: "Alert Action", handler: {[unowned self] _ in
            let colorCode = CGFloat(Int(arc4random_uniform(255)))/255
            self.childView.backgroundColor = UIColor(white: colorCode, alpha: 1.0)
        }))
    }
}

class ViewModel: BA_BaseViewModel {

}
