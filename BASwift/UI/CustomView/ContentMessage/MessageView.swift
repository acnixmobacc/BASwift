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

    public var handler: (() -> Void)?
    
    @IBOutlet weak var messageLabel: UILabel!

    @IBAction func action(_ sender: UIButton) {
        if let handler = self.handler{
            handler()
        }
    }
    
    public func showMessage(withMessage message: String) {
        messageLabel.text = message
    }
}
