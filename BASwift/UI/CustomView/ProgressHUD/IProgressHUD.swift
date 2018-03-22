//
//  IProgressHUD.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public enum ProgressStrategy{
    public enum DismissStrategy {
        case countable, immediately
    }
}

open class ProgressOptions{
    var frame: CGRect
    
    init(withFrame frame:CGRect = CGRect(x: 100, y: 100, width: 100, height: 100)) {
        self.frame = frame
    }
    
    static let `default`: ProgressOptions = {
        return ProgressOptions()
    }()
}


public protocol IProgressHUD {
    
    var options: ProgressOptions{get set}
    
    init(withOptions options:ProgressOptions)
    
    func start(inView view:UIView)
    
    func stop()
}
