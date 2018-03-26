//
//  MainViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit
import BASwift

class MainViewController: BA_BaseViewController<MainViewModel> {

    @IBOutlet weak var childView: LoadableView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.childView.showLoading()
        //self.view.showProgress()
    }

    @IBAction func stopChildProgress(_ sender: Any) {
        childView.hideLoading()
    }
    @IBAction func stopParentProgress(_ sender: Any) {
        
    }
}
