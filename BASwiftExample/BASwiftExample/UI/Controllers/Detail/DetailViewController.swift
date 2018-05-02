//
//  DetailViewController.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import UIKit

class DetailViewController: BaseViewController<DetailViewModel> {

    // MARK: - Properties
    weak var coordinatorDelegate: CollectionCoordinatorDelegate?

    var tableViewAdapter: DetailTableAdapter?

    override lazy var progressManager: ILoadable = {[unowned self] in
        return ProgressHUDManager(forView: self.view, dismissStrategy: .countable)
    }()

    // MARK: - UI Fields
    @IBOutlet weak private var tableView: UITableView!

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAdapter = DetailTableAdapter(tableView, [UIDetailItem(), UIItem(),
                                                               UIDetailItem(), UIDetailItem(),
                                                               UIItem(), UIDetailItem()])
        tableViewAdapter?.delegate = self

    }

    // MARK: - Button Actions
    @IBAction func stop(_ sender: Any) {
        progressManager.hideLoading()
    }

    @IBAction func progressAction(_ sender: UIBarButtonItem) {
        progressManager.showLoading()
    }

}

extension DetailViewController: DetailTableAdapterDelegate {
    func onSelectItem() {
        coordinatorDelegate?.showCollection()
    }
}
