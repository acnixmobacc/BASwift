//
//  BaseContentView.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol  IMessageView{
    var handler: (() -> Void)? {get set}
    
    func showMessage(withMessage message:String)
}

public class MessageView : UIView, IMessageView {

    //MARK: - Properties
    public var handler: (() -> Void)?
    
    //MARK: - UIElement
    @IBOutlet weak var messageLabel: UILabel!

    //MARK: - UI Actions
    @IBAction func action(_ sender: UIButton) {
        if let handler = self.handler{
            handler()
        }
    }
    
    //MARK: - Methods
    public func showMessage(withMessage message: String) {
        messageLabel.text = message
    }
}
