//
//  PhotoRemoteProviderTests.swift
//  VerimiPhotoAppTests
//
//  Created by Pankaj Sachdeva on 12.05.24.
//

import XCTest
@testable import VerimiPhotoApp

final class PhotoRemoteProviderTests: XCTestCase {

    func testPhotoJSONDecoderDecodesPhoto() throws {
        let decoder = JSONDecoder()
        let photo = try decoder.decode(PhotoModel.self, from: testPhotoModel)

        XCTAssertEqual(photo.id, 1)
    }

    func testClientDoesFetchPhotoData() async throws {
        let downloader = TestDownloader()
        let client = PhotoRemoteProvider(downloader: downloader)
        let photos = try await client.photos

        XCTAssertEqual(photos.count, 4)
    }
}
