//
//  Device+OS.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 01/11/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import UIKit

public extension Device {
    /// Struct to work with OS version
    struct OSVersion {
        public static var current: OSVersion {
            return OSVersion(UIDevice.current.systemVersion)
        }
        public static var os8 = OSVersion("8")
        public static var os9 = OSVersion("9")
        public static var os10 = OSVersion("10")
        public static var os11 = OSVersion("11")
        public static var os11_0_1 = OSVersion("11.0.1")
        public static var os11_0_2 = OSVersion("11.0.2")
        public static var os11_0_3 = OSVersion("11.0.3")
        public static var os11_1_0 = OSVersion("11.1.0")

        fileprivate(set) var version: String
        public init(_ version: String) {
            let characters = CharacterSet(charactersIn: "01234567890.")
            let string = version.trimmingCharacters(in: characters.inverted)
            let clearedString = version.trimmingCharacters(in: characters)
            if clearedString.count > 0 {
                print("WARNING: Wrong delimiter used for AppVersion: \(version). Will remove it.")
            }
            self.version = string
        }
        fileprivate var versionNumbers: [String] {
            let characters = CharacterSet(charactersIn: ".")
            var components = version.components(separatedBy: characters)
            while true {
                if  let last = components.last, last == "0"{
                    components.removeLast()
                    continue
                }
                break
            }
            return components
        }
    }
}

/// `Equatable` protocol implementation
extension Device.OSVersion: Equatable {
    public static func == (lhs: Device.OSVersion, rhs: Device.OSVersion) -> Bool {
        let lComponents = lhs.versionNumbers
        let rComponents = rhs.versionNumbers
        guard lComponents.count == rComponents.count else { return false }
        let maxIndex = lComponents.count
        for index in 0..<maxIndex {
            if  let lInt = Int(lComponents[index]), let rInt = Int(rComponents[index]), lInt != rInt {
                return false
            }
        }
        return true
    }
}

/// `Comparable` protocol implementation
extension Device.OSVersion: Comparable {
    public static func < (lhs: Device.OSVersion, rhs: Device.OSVersion) -> Bool {
        let lComponents = lhs.versionNumbers
        let rComponents = rhs.versionNumbers
        let maxIndex = max(lComponents.count, rComponents.count)
        for index in 0..<maxIndex {
            guard lComponents.count != index else { return true }
            guard rComponents.count != index else { return false }
            if  let lInt = Int(lComponents[index]), let rInt = Int(rComponents[index]) {
                if lInt < rInt { return true }
                if lInt > rInt { return false }
            }
        }
        return false
    }
}
