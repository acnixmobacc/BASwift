//
//  DetailViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import UIKit

class DetailViewController: BA_BaseViewController<DetailViewModel> {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewAdapter : DetailTableAdapter?
    
    override lazy var progressManager: ILoadable = {[unowned self] in
        return ProgressHUDManager.init(forView: self.view, dismissStrategy: .countable)
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableViewAdapter = DetailTableAdapter.init(tableView, [UIDetailItem(), UIItem(),
                                                               UIDetailItem(), UIDetailItem(),
                                                               UIItem(), UIDetailItem()])
        
    }
    
    @IBAction func stop(_ sender: Any) {
        progressManager.hideLoading()
    }
    
    @IBAction func progressAction(_ sender: UIBarButtonItem) {
        progressManager.showLoading()
    }
    
}



