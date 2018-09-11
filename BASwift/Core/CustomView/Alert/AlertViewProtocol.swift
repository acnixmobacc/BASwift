//
//  IAlertView.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol AlertViewProtocol {
    func show(vc: UIViewController, alert: IAlert)
}
