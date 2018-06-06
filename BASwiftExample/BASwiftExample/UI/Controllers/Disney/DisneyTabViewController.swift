//
//  DisneyTabViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 5.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

protocol DisneyCoordinatorDelegate: CoordinatorDelegate {
    func showCart()
}

class DisneyTabViewController: BABaseTabController {

    weak var coordinatorDelegate: DisneyCoordinatorDelegate?
}
