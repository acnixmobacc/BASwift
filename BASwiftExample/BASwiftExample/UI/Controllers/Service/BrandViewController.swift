//
//  ServiceViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import UIKit

class BrandViewController: BaseViewController {
    weak var coordinatorDelegate: DashboardCoordinatorDelegate?

    var viewModel: BrandViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onDidLoad()
    }
}

extension BrandViewController: BrandViewProtocol {
    func onGetBrandsSuccess() {
        Logger.debug("Success return")
    }

    func onGetBrandsFail() {
        Logger.debug("Fail")
    }

}
