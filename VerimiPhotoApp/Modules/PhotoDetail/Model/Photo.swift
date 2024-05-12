//
//  FavoritePhoto.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 10.05.24.
//

import Foundation
import SwiftData

@Model
class Photo {
    @Attribute(.unique)
    let id: Int
    let thumbnailUrl: String
    let imageUrl: String
    let title: String
    
    init(
        id: Int,
        thumbnailUrl: String,
        imageUrl: String,
        title: String
    ) {
        self.id = id
        self.thumbnailUrl = thumbnailUrl
        self.imageUrl = imageUrl
        self.title = title
    }
}
