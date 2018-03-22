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
        //self.childView.showLoading()
        //showProgress()
    }

    @IBAction func stopChildProgress(_ sender: Any) {
        //childView.hideLoading()
        hideProgress()
    }
}

class ViewModel: BA_BaseViewModel {

}
