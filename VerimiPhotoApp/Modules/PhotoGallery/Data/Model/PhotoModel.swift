//
//  ProductModel.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 09.05.24.
//

import Foundation

struct PhotoModel: Codable, Hashable {
    let albumId, id: Int
    let title: String
    var url, thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        case albumId
        case id, title, url
        case thumbnailUrl
    }
}


