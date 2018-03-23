//
//  ContentManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class ContentManager : IContentManager{

    var view: UIView&IMessageView
    
    required init(withView view: UIView&IMessageView) {
        self.view = view
    }
    
    func showMessage(withMessage message: String, handler: (() -> Void)? = nil) {
        self.view.showMessage(withMessage: message)
        self.view.handler = handler
    }
}
