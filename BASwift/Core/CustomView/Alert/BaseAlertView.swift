//
//  BaseAlertView.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 10/02/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import UIKit

open class BaseAlertView: AlertViewProtocol {

    public init(){ }
    
    // MARK: - Methods
    open func show(vc: UIViewController, alert: IAlert) {
        let alertController = UIAlertController(title: alert.title, message: alert.message,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: alert.handler))
        vc.present(alertController, animated: true, completion: nil)
    }
}
