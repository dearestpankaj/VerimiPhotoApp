//
//  ImageGalleryView.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 08.05.24.
//

import SwiftUI
import SwiftData

struct PhotoGalleryView: View {
    @Environment(\.modelContext) private var context
    @ObservedObject var viewModel = ImageGalleryViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(viewModel.photos, id: \.self) { photo in
                        let photoDetailViewModel = PhotoDetailViewModel(photo: photo, datasource: PhotoDetailsDataSource(modelContext: context))
                        
                        NavigationLink(destination: PhotoDetailView(viewModel: photoDetailViewModel)) {
                            PhotoItem(photo: photo)
                        }
                        
                    }
                }
            }
            .navigationTitle("Photo Gallery")
        }
        .padding()
        .task {
            do {
                try await viewModel.fetchPhotos()
            } catch {
                viewModel.errorWrapper = ErrorWrapper(error: error,
                                            guidance: "Please try after some time.")
            }
        }
        .sheet(item: $viewModel.errorWrapper) {
        } content: { wrapper in
            ErrorView(errorWrapper: wrapper)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Photo.self, configurations: config)
        return PhotoGalleryView(viewModel: ImageGalleryViewModel(provider: PhotoRemoteProvider()))
            .modelContainer(container)
}
