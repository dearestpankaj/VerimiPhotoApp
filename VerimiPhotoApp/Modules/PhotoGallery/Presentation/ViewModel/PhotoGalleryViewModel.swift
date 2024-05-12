//
//  ImageGalleryView.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 08.05.24.
//

import Foundation

@MainActor
class PhotoGalleryViewModel: ObservableObject {
    @Published private(set) var photos: [Photo] = []
    @Published var errorWrapper: ErrorWrapper?
    
    private let provider: PhotoRemoteProviderProtocol

    init(
        provider: PhotoRemoteProviderProtocol
    ) {
        self.provider = provider
    }
    
    func fetchPhotos() async throws {
        let photoModelList = try await provider.photos
        photos = photoModelList.map { Photo(id: $0.id, thumbnailUrl: $0.thumbnailUrl, imageUrl: $0.url, title: $0.title) }
    }

}
