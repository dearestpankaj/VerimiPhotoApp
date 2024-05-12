//
//  PhotoItem.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 10.05.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotoItem: View {
    let photo: Photo
    let width = 80.0
    let height = 80.0
    
    var body: some View {
        
        WebImage(url: URL(string: photo.thumbnailUrl)) { image in
            image.resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        } placeholder: {
            PhotoPlaceholderView(width: width, height: height)
        }
        .transition(.fade(duration: 0.5))
    }
}

#Preview {
    PhotoItem(
        photo: Photo(
            id: 1,
            thumbnailUrl: "https://via.placeholder.com/150/92c952",
            imageUrl: "https://via.placeholder.com/150/92c952",
            title: "accusamus beatae ad facilis cum similique qui sunt"
        )
    )
}
