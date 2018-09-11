//
//  Logger.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 27.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
import UIKit

open class Logger {

    // MARK: - Log Type
    enum LogType: String {
        case verbose = "Verbose"
        case debug = "DEBUG"
        case info = "INFO"
        case warning = "WARNING"
        case error = "ERROR"
    }

    // MARK: - Properties
    public static var isEnable: Bool = true

    // MARK: - Class Methods
    fileprivate class func log(message: String, type: LogType) {
        if isEnable {
            print(String(format: "%@ - %@: %@", type.rawValue, Date().formattedText(withFormat: Date.dd_mm_yyyy_hh_mm_ss), message))
        }

    }
    public class func verbose(_ message: String) {
        log(message: message, type: .verbose)
    }

    public class func debug(_ message: String) {
        log(message: message, type: .debug)
    }

    public class func info(_ message: String) {
        log(message: message, type: .info)
    }

    public class func warning(_ message: String) {
        log(message: message, type: .warning)
    }

    public class func error(_ message: String) {
        log(message: message, type: .error)
    }

}
