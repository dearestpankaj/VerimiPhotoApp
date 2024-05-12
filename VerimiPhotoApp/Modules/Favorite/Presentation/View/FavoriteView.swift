//
//  FavoriteView.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 08.05.24.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Environment(\.modelContext) private var context
    @ObservedObject var viewModel: FavoriteViewModel
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(viewModel.photos, id: \.self) { photo in
                        let photoDetailViewModel = PhotoDetailViewModel(photo: photo, datasource: PhotoDetailsLocalDataSource(modelContext: context))
                        NavigationLink(destination: PhotoDetailView(viewModel: photoDetailViewModel)) {
                            PhotoItem(photo: photo)
                        }
                        
                    }
                }
            }
            .navigationTitle("Favorites")
            .task {
                do {
                    try await viewModel.fetchFavoritePhotos()
                } catch {
                    viewModel.photos = []
                    viewModel.errorWrapper = ErrorWrapper(error: error,
                                                guidance: "No image added as favorite. Please add image as favorite in Photo Gallery")
                }
            }
        }
        .padding()
        .sheet(item: $viewModel.errorWrapper) {
        } content: { wrapper in
            ErrorView(errorWrapper: wrapper)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Photo.self, configurations: config)
    return FavoriteView(viewModel: FavoriteViewModel(datasource: PhotoDetailsLocalDataSource(modelContext: container.mainContext)))
            .modelContainer(container)
}
