//
//  FavoriteViewModel.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 11.05.24.
//

import Foundation

@MainActor
class FavoriteViewModel: ObservableObject {
    
    let datasource: PhotoDetailsLocalDataSourceProtocol
    
    @Published var photos: [Photo] = []
    @Published var errorWrapper: ErrorWrapper?
    
    init(
        datasource: PhotoDetailsLocalDataSourceProtocol
    ) {
        self.datasource = datasource
    }
    
    func fetchFavoritePhotos() async throws {
        photos = try await datasource.getFavoritePhotoList()
        if photos.isEmpty {
            throw AppError.missingData
        }
    }
}
