//
//  MockDataUtilities.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 30/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import SwiftyJSON

public enum FileContentsError: Error {
    case fileNotExist
    case contentsNotValid

    public var message: String {
        switch self {
        case .contentsNotValid:
            return "File contents not valid JSON"
        case .fileNotExist:
            return "File not exist"
        }
    }
}

open class MockDataUtilities {
    public static func getData<T: IBaseResponse>(fileName: String, onSuccess: (T) -> Void,
                                                 onFailure:@escaping (BaseErrorResponse) -> Void) {
        do {
            let data = try fileContentsToJSON(fileName)
            onSuccess(T(data))
        } catch FileContentsError.contentsNotValid {
            onFailure(BaseErrorResponse(errorMessage: FileContentsError.contentsNotValid.message))
        } catch FileContentsError.fileNotExist {
            onFailure(BaseErrorResponse(errorMessage: FileContentsError.fileNotExist.message))
        } catch {
            onFailure(BaseErrorResponse())
        }
    }

    public static func getListData<T: IBaseResponse>(fileName: String, onSuccess: ([T]) -> Void,
                                                     onFailure:@escaping (BaseErrorResponse) -> Void) {
        do {
            let data = try fileContentsToJSON(fileName)
            let response = data.arrayValue.map({ item -> T in
                return T(item)
            })
            onSuccess(response)
        } catch FileContentsError.contentsNotValid {
            onFailure(BaseErrorResponse(errorMessage: FileContentsError.contentsNotValid.message))
        } catch FileContentsError.fileNotExist {
            onFailure(BaseErrorResponse(errorMessage: FileContentsError.fileNotExist.message))
        } catch {
            onFailure(BaseErrorResponse())
        }
    }

    public static func fileContentsToJSON(_ fileName: String) throws -> JSON {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let text = try String(contentsOfFile: path, encoding: .utf8)
                return JSON(parseJSON: text)
            } catch {
                throw FileContentsError.contentsNotValid
            }
        } else {
            throw FileContentsError.fileNotExist
        }
    }
}
