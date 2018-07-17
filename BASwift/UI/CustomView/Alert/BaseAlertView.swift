//
//  BaseAlertView.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 10/02/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import UIKit

open class BaseAlertView: IAlertView {

    // MARK: - Methods
    public func show(vc: UIViewController, alert: IAlert) {
        let alertController = UIAlertController(title: alert.title, message: alert.message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: alert.handler))
        vc.present(alertController, animated: true, completion: nil)
    }
}
