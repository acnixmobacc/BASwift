//
//  UITableViewCell+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 25/03/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    
    //MARK: - Static Methods
    static func registerSelf(_ toTableView: UITableView?) {
        let nib = UINib(nibName: self.className, bundle: nil)
        toTableView?.register(nib, forCellReuseIdentifier: self.className)
    }

}


