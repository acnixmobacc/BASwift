//
//  InventoryViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 6.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class InventoryViewController: BaseViewController {

    weak var coordinatorDelegate: DisneyCoordinatorDelegate?

    @IBAction func buttonAction(_ sender: Any) {
        coordinatorDelegate?.showProductDetail()
    }
}
