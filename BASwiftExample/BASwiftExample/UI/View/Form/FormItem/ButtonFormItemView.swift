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
    var itemViewHeight: CGFloat = 60

    // MARK: - UI Field
    @IBOutlet weak private var button: UIButton!

    // MARK: - Block Methods
    var onClick: (() -> Void)?

    // MARK: - Methods
    func setupUI(title: String, buttonColor: UIColor = .red) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = buttonColor
    }

    // MARK: - Action Methods
    @IBAction func action(_ sender: Any) {
        guard let onClick = onClick else {
            return
        }
        onClick()
    }
}
