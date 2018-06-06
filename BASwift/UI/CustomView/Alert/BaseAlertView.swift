//
//  BaseAlertView.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 10/02/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import UIKit

class BaseAlertView: IAlertView {

    // MARK: - Methods
    func show(vc: UIViewController, alert: BaseAlert) {
        let alertController = UIAlertController(title: alert.title, message: alert.message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: alert.handler))
        vc.present(alertController, animated: true, completion: nil)
    }
}
