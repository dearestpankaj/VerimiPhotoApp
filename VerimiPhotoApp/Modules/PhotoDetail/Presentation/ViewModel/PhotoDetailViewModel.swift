//
//  PhotoDetailViewModel.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 10.05.24.
//

import Foundation

class PhotoDetailViewModel: ObservableObject {
    let datasource: PhotoDetailsLocalDataSourceProtocol
    
    @Published var isFavorite: Bool = false
    @Published var photo: Photo
    
    init(
        photo: Photo,
        datasource: PhotoDetailsLocalDataSourceProtocol
    ) {
        self.photo = photo
        self.datasource = datasource
        
        isFavorite = datasource.isFavoritePhoto(photo.id)
    }
    
    func toggleFavorite() {
        if isFavorite {
            datasource.removeFavoritePhoto(photo.id)
        } else {
            datasource.setFavoritePhoto(photo)
        }
        isFavorite = datasource.isFavoritePhoto(photo.id)
    }
}
