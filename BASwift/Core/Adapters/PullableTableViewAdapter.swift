//
//  PullableTableViewAdapter.swift
//  BASwift
//
//  Created by Burak Akkaya on 27.08.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

open class PullableTableViewAdapter: TableViewAdapter {

    // MARK: - Properties
    public let refresher: UIRefreshControl
    weak var pullableDelegate: Pullable?

    // MARK: - Initialization
    public init(_ tableView: UITableView, pullableDelegate: Pullable) {
        self.refresher = UIRefreshControl()
        super.init(tableView)
        self.pullableDelegate = pullableDelegate
        setPullable()
    }

    // MARK: - Methods
    open func setPullable() {
        refresher.addTarget(self, action: #selector(pull), for: .valueChanged)
        tableView.addSubview(refresher)
    }

    @objc
    open func pull() {
        pullableDelegate?.onPull()
    }

    @objc
    open func stopPull() {
        refresher.endRefreshing()
    }
}
