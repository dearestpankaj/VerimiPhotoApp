//
//  MainTabView.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 08.05.24.
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    @Environment(\.modelContext) private var context
    
    var body: some View {
        TabView {
            PhotoGalleryView(viewModel: PhotoGalleryViewModel(provider: PhotoRemoteProvider()))
                .tabItem { Label("Photo Gallery", systemImage: "photo") }
            
            FavoriteView(viewModel: FavoriteViewModel(datasource: PhotoDetailsLocalDataSource(modelContext: context)))
                .tabItem { Label("Favorites", systemImage: "star") }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Photo.self, configurations: config)
        return MainTabView()
            .modelContainer(container)
}
