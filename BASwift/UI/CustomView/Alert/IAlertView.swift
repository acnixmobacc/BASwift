//
//  IAlertView.swift
//  BASwift
//
//  Created by Burak Akkaya on 23.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol IAlertView {
    func show(vc: UIViewController, alert: BaseAlert)
}
