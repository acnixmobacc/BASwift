//
//  MockDataUtilities.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 30/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import SwiftyJSON

public enum FileError: Error {
    case fileNotExist
    case contentsNotValid
    case unknown

    public var message: String {
        switch self {
        case .contentsNotValid:
            return "File contents not valid"
        case .fileNotExist:
            return "File not exist"
        case .unknown:
            return "Unexpected Error"
        }
    }
}

open class MockDataUtilities {

    // MARK: - Static Methods
    public static func getData<T: Codable>(fileName: String, onSuccess: (T) -> Void,
                                           onFailure:@escaping (FileError) -> Void) {
        do {
            let data = try fileContentsToData(fileName)
            onSuccess(try JSONDecoder().decode(T.self, from: data))
        } catch FileError.fileNotExist {
            onFailure(FileError.fileNotExist)
        } catch DecodingError.dataCorrupted {
            onFailure(FileError.contentsNotValid)
        } catch {
            onFailure(FileError.unknown)
        }
    }

    // MARK: - Private Static Methods
    private static func fileContentsToData(_ fileName: String) throws -> Data {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            guard let data = NSData(contentsOfFile: path) as Data? else {
                throw FileError.fileNotExist
            }
            return data
        } else {
            throw FileError.fileNotExist
        }
    }
}
