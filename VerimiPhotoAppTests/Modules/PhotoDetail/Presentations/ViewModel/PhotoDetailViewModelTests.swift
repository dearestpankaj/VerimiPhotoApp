//
//  PhotoDetailViewModelTests.swift
//  VerimiPhotoAppTests
//
//  Created by Pankaj Sachdeva on 12.05.24.
//

import XCTest
@testable import VerimiPhotoApp

final class PhotoDetailViewModelTests: XCTestCase {
    var sut: PhotoDetailViewModel!
    
    @MainActor override func setUpWithError() throws {
        let provider = MockPhotoDetailsDataSource()
        sut = PhotoDetailViewModel(photo: Photo(id: 1, thumbnailUrl: "", imageUrl: "", title: ""), datasource: provider)
    }

    func testToggleFavorite_Success() throws {
        sut.toggleFavorite()
        XCTAssert(sut.isFavorite)
        
        sut.toggleFavorite()
        XCTAssert(!sut.isFavorite)
    }
}

