//
//  PhotoGalleryViewModelTests.swift
//  VerimiPhotoAppTests
//
//  Created by Pankaj Sachdeva on 12.05.24.
//

import XCTest
@testable import VerimiPhotoApp

@MainActor
final class PhotoGalleryViewModelTests: XCTestCase {

    var sut: PhotoGalleryViewModel!
    var provider: PhotoRemoteProviderProtocol!
    let testDownloader = TestDownloader()
    
    override func setUpWithError() throws {
        let provider = PhotoRemoteProvider(downloader: testDownloader)
        sut = PhotoGalleryViewModel(provider: provider)
    }

    func testFetchPhotos_Success_ReceivePhotos() async throws {
        try await sut.fetchPhotos()
        XCTAssertEqual(sut.photos.count, 4)
    }
    
    func testFetchPhotos_Failure_IncorrectJsonThrows() async throws {
        testDownloader.getValidData = false
        
        do {
            _ = try await sut.fetchPhotos()
            XCTFail("Error needs to be thrown")
        } catch { }
    }

}
