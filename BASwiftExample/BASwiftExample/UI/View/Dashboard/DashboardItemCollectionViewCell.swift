//
//  DashboardItemCollectionViewCell.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class DashboardItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setView(withData data: UIDashboardItem) {
        titleLabel.text = data.title
    }

}
