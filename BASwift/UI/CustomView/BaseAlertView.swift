//
//  BaseAlertView.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 10/02/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import UIKit

public protocol IAlertView {
    func show(vc: UIViewController, alert: BaseAlert)
}

class BaseAlertView: IAlertView {
    func show(vc: UIViewController, alert: BaseAlert) {
        let alert = UIAlertController(title: alert.title, message: alert.message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
