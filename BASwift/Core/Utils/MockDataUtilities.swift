//
//  MockDataUtilities.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 30/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

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
    public static func getData<T: Decodable>(fileName: String, onSuccess: (T) -> Void,
                                             onFailure: ((FileError) -> Void)?) {
        do {
            let data = try fileContentsToData(fileName)
            onSuccess(try JSONDecoder().decode(T.self, from: data))
        } catch FileError.fileNotExist {
            guard let onFailure = onFailure else { return }
            onFailure(FileError.fileNotExist)
        } catch DecodingError.dataCorrupted {
            guard let onFailure = onFailure else { return }
            onFailure(FileError.contentsNotValid)
        } catch {
            guard let onFailure = onFailure else { return }
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
