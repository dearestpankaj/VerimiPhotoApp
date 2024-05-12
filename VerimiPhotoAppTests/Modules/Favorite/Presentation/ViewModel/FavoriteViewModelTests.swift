//
//  FavoriteViewModelTests.swift
//  VerimiPhotoAppTests
//
//  Created by Pankaj Sachdeva on 12.05.24.
//

import XCTest
@testable import VerimiPhotoApp

@MainActor
final class FavoriteViewModelTests: XCTestCase {
    var datasource: PhotoDetailsLocalDataSourceProtocol! = nil
    var sut: FavoriteViewModel!
    
    override func setUpWithError() throws {
        datasource = MockPhotoDetailsDataSource()
        sut = FavoriteViewModel(datasource: datasource)
    }

    func testFetchFavoritePhotos() async throws {
        datasource.setFavoritePhoto(Photo(id: 1, thumbnailUrl: "", imageUrl: "", title: ""))
        datasource.setFavoritePhoto(Photo(id: 2, thumbnailUrl: "", imageUrl: "", title: ""))
        try await sut.fetchFavoritePhotos()
        XCTAssert(sut.photos.count == 2)
    }

}
