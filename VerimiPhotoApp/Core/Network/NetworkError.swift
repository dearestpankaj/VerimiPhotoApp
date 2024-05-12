//
//  NetworkError.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 09.05.24.
//

import Foundation

enum AppError: Error {
    case missingData
    case noFavoritePhoto
    case networkError
    case unexpectedError(error: Error)
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Unable to get the photos.", comment: "")
        case .noFavoritePhoto:
            return NSLocalizedString("No favorite photo found, please add favorites from photo gallery.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching photos data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}

