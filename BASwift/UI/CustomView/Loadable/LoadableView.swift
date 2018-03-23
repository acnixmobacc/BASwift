//
//  UIView+Loadable.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public class LoadableView: UIView, ILoadable, IContentable{
    public var progressHUD = BA_DependencyManager.sharedInstance.container.resolve(IProgressHUD.self)!

    lazy public var contentManager : IContentManager = {
        var messageView = MessageView.fromNib()
        messageView.frame = CGRect(origin: .zero, size: self.frame.size)
        return ContentManager.init(withView: messageView)
    }()
    
}
