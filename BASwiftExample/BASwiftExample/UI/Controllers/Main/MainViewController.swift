//
//  MainViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import UIKit

class MainViewController: BaseViewController {

    weak var coordinatorDelegate: ProductCoordinatorDelegate?

    @IBOutlet weak private var childView: BAProgressView!

    @IBOutlet weak private var childProgressButton: UIButton!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    @IBAction func stopChildProgress(_ sender: Any) {
        childProgressButton.isSelected = !childProgressButton.isSelected

        childProgressButton.isSelected ? childView.showProgress() : childView.hideProgress()
    }

    @IBAction func toServiceAction(_ sender: Any) {
        coordinatorDelegate?.showService()
    }
}
