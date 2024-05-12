//
//  PhotoDetailView.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 10.05.24.
//

import SwiftUI
import SwiftData

struct PhotoDetailView: View {
    @ObservedObject var viewModel: PhotoDetailViewModel
    let defaultPlaceholderSize = 300.0
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.photo.imageUrl)) { photo in
                VStack {
                    photo
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            } placeholder: {
                VStack {
                    PhotoPlaceholderView(width: defaultPlaceholderSize, height: defaultPlaceholderSize)
                }
              }
            
            Text(viewModel.photo.title)
            .multilineTextAlignment(.leading)
            .font(.subheadline)
            Spacer()
        }
        .padding()
        .toolbar {
            Button {
                viewModel.toggleFavorite()
            } label: {
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .tint(.pink)
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Photo.self, configurations: config)
    return PhotoDetailView(
        viewModel: PhotoDetailViewModel(
            photo: Photo(
                id: 1, thumbnailUrl: "https://via.placeholder.com/150/92c952", imageUrl: "https://via.placeholder.com/600/92c952", title: "accusamus beatae ad facilis cum similique qui sunt"
            ), datasource: PhotoDetailsLocalDataSource()
        )
    )
    .modelContainer(container)
}
