//
//  Device+Screen.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 01/11/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension Device.Screen {
    enum Orientation: String {
        case landscapeLeft
        case landscapeRight
        case portraitUp
        case portraitDown
        case unknown
    }
    static var currentOrientation: Orientation {
        switch UIApplication.shared.statusBarOrientation {
        case .landscapeLeft:
            return .landscapeLeft
        case .landscapeRight:
            return .landscapeRight
        case .portrait:
            return .portraitUp
        case .portraitUpsideDown:
            return .portraitDown
        default:
            return .unknown
        }
    }
    static var isLandscape: Bool {
        return ( UIApplication.shared.statusBarOrientation == .landscapeLeft
            || UIApplication.shared.statusBarOrientation == .landscapeRight )
    }
    static var isPortrait: Bool {
        return !Device.Screen.isLandscape
    }
}

public extension Device.Screen {
    enum Inch: CGFloat {
        case unknown = 0
        case inches_3_5 = 3.5
        case inches_4_0 = 4.0
        case inches_4_7 = 4.7
        case inches_5_5 = 5.5
        case inches_7_9 = 7.9
        case inches_9_7 = 9.7
        case inches_12_9 = 12.9
    }
    static var size: CGSize {
        let size = UIScreen.main.bounds.size
        return size
    }
    static var inch: Inch {
        let size = UIScreen.main.bounds.size
        let height = max(size.width, size.height)
        switch height {
        case 480:
            return .inches_3_5
        case 568:
            return .inches_4_0
        case 667:
            return ( scale == .x3 ? .inches_5_5 : .inches_4_7 )
        case 736:
            return .inches_5_5
        case 1024:
            switch Device.DeviceType.current {
            case .iPadMini, .iPadMini3, .iPadMini4, .iPadMiniRetina:
                return .inches_7_9
            default:
                return .inches_9_7
            }
        case 1366:
            return .inches_12_9
        default:
            return .unknown
        }
    }
}

public extension Device.Screen {
    enum Scale: CGFloat {
        case x1 = 1.0
        case x2 = 2.0
        case x3 = 3.0
        case unknown = 0
    }
    static var scale: Scale {
        let scale = UIScreen.main.scale
        switch scale {
        case 1.0:
            return .x1
        case 2.0:
            return .x2
        case 3.0:
            return .x3
        default:
            return .unknown
        }
    }
}
