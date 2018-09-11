//
//  BaseContentView.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol  ErrorViewProtocol {
    var handler: (() -> Void)? { get set }

    func show(with message: String)
}

public class BAErrorView: UIView, ErrorViewProtocol {

    // MARK: - Properties
    public var handler: (() -> Void)?

    // MARK: - UIElement
    @IBOutlet private weak var messageLabel: UILabel!

    // MARK: - UI Actions
    @IBAction func action(_ sender: UIButton) {
        if let handler = self.handler {
            handler()
        }
    }

    // MARK: - Methods
    public func show(with message: String) {
        messageLabel.text = message
    }
}
