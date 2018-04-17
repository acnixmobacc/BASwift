//
//  Device+Type.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 01/11/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension Device {
    enum DeviceType: String, EnumProtocol {
        //iphone
        case iPhone2G
        case iPhone3G
        case iPhone3GS
        case iPhone4
        case iPhone4S
        case iPhone5
        case iPhone5C
        case iPhone5S
        case iPhone6
        case iPhone6Plus
        case iPhone6S
        case iPhone6SPlus
        case iPhoneSE
        case iPhone7
        case iPhone7Plus
        case iPhone8
        case iPhone8Plus
        case iPhoneX
        //ipod
        case iPodTouch1G
        case iPodTouch2G
        case iPodTouch3G
        case iPodTouch4G
        case iPodTouch5G
        case iPodTouch6G
        //ipad
        case iPad
        case iPad2
        case iPad3
        case iPad4
        case iPadMini
        case iPadMiniRetina
        case iPadMini3
        case iPadMini4
        case iPadAir
        case iPadAir2
        case iPadPro9Inch
        case iPadPro12Inch
        //simulator
        case simulator
        case notAvailable
        public static var current: DeviceType {
            var systemInfo = utsname()
            uname(&systemInfo)
            let machine = systemInfo.machine
            let mirror = Mirror(reflecting: machine)
            var identifier = ""
            for child in mirror.children {
                if let value = child.value as? Int8, value != 0 {
                    identifier.append(String(UnicodeScalar(UInt8(value))))
                }
            }
            return DeviceType(identifier: identifier)
        }
        internal var identifiers: [String] {
            switch self {
            case .notAvailable: return []
            case .simulator: return ["i386", "x86_64"]
            //iphone identifiers
            case .iPhone2G: return ["iPhone1,1"]
            case .iPhone3G: return ["iPhone1,2"]
            case .iPhone3GS: return ["iPhone2,1"]
            case .iPhone4: return ["iPhone3,1", "iPhone3,2", "iPhone3,3"]
            case .iPhone4S: return ["iPhone4,1"]
            case .iPhone5: return ["iPhone5,1", "iPhone5,2"]
            case .iPhone5C: return ["iPhone5,3", "iPhone5,4"]
            case .iPhone5S: return ["iPhone6,1", "iPhone6,2"]
            case .iPhone6: return ["iPhone7,2"]
            case .iPhone6Plus: return ["iPhone7,1"]
            case .iPhone6S: return ["iPhone8,1"]
            case .iPhone6SPlus: return ["iPhone8,2"]
            case .iPhoneSE: return ["iPhone8,4"]
            case .iPhone7: return ["iPhone9,1", "iPhone9,3"]
            case .iPhone7Plus: return ["iPhone9,2", "iPhone9,4"]
            case .iPhone8: return ["iPhone10,1", "iPhone10,4"]
            case .iPhone8Plus: return ["iPhone10,2", "iPhone10,5"]
            case .iPhoneX: return ["iPhone10,3", "iPhone10,6"]
            //ipod identifiers
            case .iPodTouch1G: return ["iPod1,1"]
            case .iPodTouch2G: return ["iPod2,1"]
            case .iPodTouch3G: return ["iPod3,1"]
            case .iPodTouch4G: return ["iPod4,1"]
            case .iPodTouch5G: return ["iPod5,1"]
            case .iPodTouch6G: return ["iPod7,1"]
            //ipad identifiers
            case .iPad: return ["iPad1,1", "iPad1,2"]
            case .iPad2: return ["iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"]
            case .iPad3: return ["iPad3,1", "iPad3,2", "iPad3,3"]
            case .iPad4: return ["iPad3,4", "iPad3,5", "iPad3,6"]
            case .iPadMini: return ["iPad2,5", "iPad2,6", "iPad2,7"]
            case .iPadMiniRetina: return ["iPad4,4", "iPad4,5", "iPad4,6"]
            case .iPadMini3: return ["iPad4,7", "iPad4,8", "iPad4,9"]
            case .iPadMini4: return ["iPad5,1", "iPad5,2"]
            case .iPadAir: return ["iPad4,1", "iPad4,2", "iPad4,3"]
            case .iPadAir2: return ["iPad5,3", "iPad5,4"]
            case .iPadPro9Inch: return ["iPad6,3", "iPad6,4"]
            case .iPadPro12Inch: return ["iPad6,7", "iPad6,8"]
            }
        }
        internal init(identifier: String) {
            for device in DeviceType.all {
                for deviceId in device.identifiers {
                    guard identifier == deviceId else { continue }
                    self = device
                    return
                }
            }
            self = .notAvailable
        }
    }
}
