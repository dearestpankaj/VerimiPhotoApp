//
//  MockPhotoDetailsDataSource.swift
//  VerimiPhotoAppTests
//
//  Created by Pankaj Sachdeva on 12.05.24.
//

import Foundation
@testable import VerimiPhotoApp

class MockPhotoDetailsDataSource: PhotoDetailsLocalDataSourceProtocol {
    var favoritePhotos = [VerimiPhotoApp.Photo]()
    
    func isFavoritePhoto(_ photoID: Int) -> Bool {
        favoritePhotos.filter{ $0.id == photoID }.isEmpty ? false : true
    }
    
    func setFavoritePhoto(_ photo: VerimiPhotoApp.Photo) {
        favoritePhotos.append(photo)
    }
    
    func removeFavoritePhoto(_ photoID: Int) {
        favoritePhotos = favoritePhotos.filter{ $0.id != photoID }
    }
    
    func getFavoritePhotoList() async throws -> [VerimiPhotoApp.Photo] {
        favoritePhotos
    }
    
}
