//
//  PhotoPlaceholderView.swift
//  VerimiPhotoApp
//
//  Created by Pankaj Sachdeva on 10.05.24.
//

import SwiftUI

struct PhotoPlaceholderView: View {
    let width: Double
    let height: Double
    
    var body: some View {
        Rectangle()
            .foregroundColor(.gray.opacity(0.2))
            .frame(width: width, height: height)
    }
}

#Preview {
    PhotoPlaceholderView(width: 80, height: 80)
}
