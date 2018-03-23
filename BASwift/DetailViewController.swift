//
//  DetailViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class DetailViewController: BA_BaseViewController<DetailViewModel> {
    
    override lazy var progressManager: ILoadable = {[unowned self] in
        return ProgressHUDManager.init(forView: self.view, dismissStrategy: .immediately)
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }

    @IBAction func stopAction(_ sender: Any) {
        hideProgress()
    }
    
    @IBAction func startAction(_ sender: Any) {
        //showProgress()
        showContentMessage(withMessage: "Empty Message", handler: nil)
    }
}

class DetailViewModel: BA_BaseViewModel {
    
}
