//
//  PhotoDetailsDataSource.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 10.05.24.
//

import Foundation
import SwiftData

protocol PhotoDetailsLocalDataSourceProtocol {
    func isFavoritePhoto(_ photoID: Int) -> Bool
    func setFavoritePhoto(_ photo: Photo)
    func removeFavoritePhoto(_ photoID: Int)
    func getFavoritePhotoList() async throws -> [Photo]
}

struct PhotoDetailsLocalDataSource: PhotoDetailsLocalDataSourceProtocol {
    var modelContext: ModelContext? = nil
    
    init(
        modelContext: ModelContext? = nil
    ) {
        self.modelContext = modelContext
    }
    
    func isFavoritePhoto(_ photID: Int) -> Bool {
        getPhotoObject(photID) != nil
    }
    
    func setFavoritePhoto(_ photo: Photo) {
        modelContext?.insert(photo)
    }
    
    func removeFavoritePhoto(_ photoID: Int) {
        if let favoritePhoto = getPhotoObject(photoID) {
            modelContext?.delete(favoritePhoto)
        }
    }
    
    func getFavoritePhotoList() async throws -> [Photo] {
        let descriptor = FetchDescriptor<Photo>(sortBy: [SortDescriptor(\.id)])
        guard let photos = try modelContext?.fetch(descriptor) else {
            throw AppError.missingData
        }
        return photos
    }
    
    private func getPhotoObject(_ photoID: Int) -> Photo? {
        let predicate = #Predicate<Photo> { object in
            object.id == photoID
        }
        let descriptor = FetchDescriptor(predicate: predicate)
        
        if let favoritePhotos = try? modelContext?.fetch(descriptor),
            let first = favoritePhotos.first {
            return first
        }
        return nil
    }
    
}
