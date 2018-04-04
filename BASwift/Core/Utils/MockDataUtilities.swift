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
            return "File contents not valid JSON"
        case .fileNotExist:
            return "File not exist"
        case .unknown:
            return "Unexpected Error"
        }
    }
}

open class MockDataUtilities {
    public static func getData<T: IEntity>(fileName: String, onSuccess: (T) -> Void,
                                                 onFailure:@escaping (FileError) -> Void) {
        do {
            let data = try fileContentsToJSON(fileName)
            onSuccess(T(withData:data))
        } catch FileError.contentsNotValid {
            onFailure(FileError.contentsNotValid)
        } catch FileError.fileNotExist {
            onFailure(FileError.fileNotExist)
        } catch {
            onFailure(FileError.unknown)
        }
    }

    public static func getListData<T: IEntity>(fileName: String, onSuccess: ([T]) -> Void,
                                                     onFailure:@escaping (FileError) -> Void) {
        do {
            let data = try fileContentsToJSON(fileName)
            let response = data.arrayValue.map({ item in
                return T(withData:item)
            })
            onSuccess(response)
        }  catch FileError.contentsNotValid {
            onFailure(FileError.contentsNotValid)
        } catch FileError.fileNotExist {
            onFailure(FileError.fileNotExist)
        } catch {
            onFailure(FileError.unknown)
        }
    }

    private static func fileContentsToJSON(_ fileName: String) throws -> JSON {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let text = try String(contentsOfFile: path, encoding: .utf8)
                let json = JSON(parseJSON: text)
                
                if json.type == .null{
                    throw FileError.contentsNotValid
                }
                
                return json
            } catch {
                throw FileError.contentsNotValid
            }
        } else {
            throw FileError.fileNotExist
        }
    }
}
