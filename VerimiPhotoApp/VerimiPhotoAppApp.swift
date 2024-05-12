//
//  VerimiPhotoAppApp.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 08.05.24.
//

import SwiftData
import SwiftUI

@main
struct VerimiPhotoAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: Photo.self)
    }
}
