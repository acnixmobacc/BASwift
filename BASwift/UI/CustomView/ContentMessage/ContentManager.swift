//
//  ContentManager.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class ContentManager : IContentManager{

    //MARK: - Properties
    var view: UIView&IMessageView
    
    //MARK: - Initialization
    required init(withView view: UIView&IMessageView) {
        self.view = view
    }
    
    //MARK: - Methods
    func showMessage(withMessage message: String, handler: (() -> Void)? = nil) {
        self.view.showMessage(withMessage: message)
        self.view.handler = handler
    }
}
