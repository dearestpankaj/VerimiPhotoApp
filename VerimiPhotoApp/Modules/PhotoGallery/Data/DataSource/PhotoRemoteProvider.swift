//
//  ImageGalleryDataSource.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 09.05.24.
//

import Foundation
import Combine

protocol PhotoRemoteProviderProtocol {
    var photos: [PhotoModel] { get async throws }
}

final class PhotoRemoteProvider: PhotoRemoteProviderProtocol {
    private let photosURL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        return aDecoder
    }()

    private let downloader: any HTTPDataDownloader
    
    var photos: [PhotoModel] {
        get async throws {
            let data = try await downloader.httpData(from: photosURL)
            let products = try decoder.decode([PhotoModel].self, from: data)
            return products
        }
    }
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}
