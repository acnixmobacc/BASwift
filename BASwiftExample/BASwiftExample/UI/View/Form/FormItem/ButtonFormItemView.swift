//
//  ButtonFieldItemView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 8.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class ButtonFormItemView: UIView, IFormItemView {

    // MARK: - Properties
    var height: CGFloat = 60

    // MARK: - Block Methods
    var onClick: (() -> Void)?

    // MARK: - Action Methods
    @IBAction func action(_ sender: Any) {
        guard let onClick = onClick else {
            return
        }
        onClick()
    }
}
