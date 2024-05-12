//
//  PhotoDetailsLocalDataSourceTests.swift
//  VerimiPhotoAppTests
//
//  Created by Pankaj Sachdeva on 12.05.24.
//

import XCTest
import SwiftData
@testable import VerimiPhotoApp

@MainActor
final class PhotoDetailsLocalDataSourceTests: XCTestCase {

    var sut: PhotoDetailsLocalDataSource!
    
    override func setUpWithError() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Photo.self, configurations: config)

        sut = PhotoDetailsLocalDataSource(modelContext: container.mainContext)
    }

    func testAppStartsEmpty() async throws {
        let photos = try await sut.getFavoritePhotoList()
        XCTAssertEqual(photos.count, 0, "There should be 0 favorite photos when the app is first launched.")
    }

    func testSetFavoritePhoto() async throws {
        sut.setFavoritePhoto(Photo(id: 1, thumbnailUrl: "", imageUrl: "", title: ""))
        sut.setFavoritePhoto(Photo(id: 2, thumbnailUrl: "", imageUrl: "", title: ""))
        sut.setFavoritePhoto(Photo(id: 3, thumbnailUrl: "", imageUrl: "", title: ""))
        
        let photos = try await sut.getFavoritePhotoList()
        XCTAssertEqual(photos.count, 3, "There should be 3 photos after adding sample data.")
    }
    
    func testRemoveFavoritePhoto() async throws {
        sut.setFavoritePhoto(Photo(id: 1, thumbnailUrl: "", imageUrl: "", title: ""))
        var photos = try await sut.getFavoritePhotoList()
        XCTAssertEqual(photos.count, 1, "There should be 1 photos after adding sample data.")
        
        sut.removeFavoritePhoto(1)
        photos = try await sut.getFavoritePhotoList()
        XCTAssertEqual(photos.count, 0, "There should be 0 photos after adding sample data.")
    }
}
