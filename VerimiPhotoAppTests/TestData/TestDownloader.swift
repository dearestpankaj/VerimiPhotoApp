//
//  TestDownloader.swift
//  VerimiPhotoAppTests
//
//  Created by Pankaj Sachdeva on 12.05.24.
//

import Foundation
@testable import VerimiPhotoApp

final class TestDownloader: HTTPDataDownloader {
    
    var getValidData = true
    
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        if getValidData {
            return testPhotoData
        } else {
            return testInvalidPhotoData
        }
        
    }
}
