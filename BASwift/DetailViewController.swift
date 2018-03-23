//
//  DetailViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class DetailViewController: BA_BaseViewController<DetailViewModel> {
    
    @IBOutlet weak var tableView: UITableView!
    
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
        showContentMessage(withMessage: "Empty Message", handler: {[unowned self] in
            let colorCode = CGFloat(Int(arc4random_uniform(255)))/255
            self.tableView.backgroundColor = UIColor(white: colorCode, alpha: 1.0)
        })
    }
}

class DetailViewModel: BA_BaseViewModel {
    
}
