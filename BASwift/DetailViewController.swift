//
//  DetailViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class DetailViewController: BA_BaseViewController<DetailViewModel> {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showProgress()
    }
    
    @IBAction func stopChildProgress(_ sender: Any) {
    
        hideProgress()
    }
}

class DetailViewModel: BA_BaseViewModel {
    
}
