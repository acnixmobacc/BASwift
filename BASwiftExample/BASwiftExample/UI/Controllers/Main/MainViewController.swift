//
//  MainViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit
import BASwift

class MainViewController: BABaseViewController<MainViewModel> {

    @IBOutlet weak var childView: LoadableView!
    @IBOutlet weak var childProgressButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    @IBAction func stopChildProgress(_ sender: Any) {
        childProgressButton.isSelected = !childProgressButton.isSelected
        
        childProgressButton.isSelected ? childView.showLoading() :
            childView.hideLoading()
    }

}
