//
//  CustomError.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import Foundation

enum CustomError: Error, Equatable {

    case notFound
    case serverError(Int)
    case decodingError
    case databaseSaveFailed
    case databaseGetFailed
    case noInternetConnection
    
    // Throw in all other cases
    case unexpected(Int)

}

extension CustomError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .notFound:
            return AppStrings.noDataFound

        case .serverError:
            return AppStrings.internalError

        case .decodingError:
            return "Error occured while decoding"

        case .databaseSaveFailed:
            return "Data has been not found"

        case .databaseGetFailed:
            return "Data has been not found"

        case .noInternetConnection:
            return "You have no internet connection. Please, check your connection and try again."

        case let .unexpected(errorCode):
            return "Erorr with code \(errorCode) occured"
        }
    }

}
