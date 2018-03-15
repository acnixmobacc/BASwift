//
//  UIView+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 25/03/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UIView {

    
    @IBInspectable var cornerRadius : CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
            
        }
    }
    
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    class func fromNib(nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self)
    }

    class func fromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(nibNameOrNil: nibNameOrNil, type: T.self)
        return v!
    }

    class func fromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let myNibName = nibNameOrNil {
            name = myNibName
        } else {
            name = myNibName
        }

        guard let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil) else {
            fatalError("Could not load nib")
        }

        for v in nibViews {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }

    class var myNibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }

    class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: myNibName, ofType: "nib") {
            return UINib(nibName: myNibName, bundle: nil)
        } else {
            return nil
        }
    }
}
