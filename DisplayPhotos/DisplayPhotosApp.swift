//
//  DisplayPhotosApp.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 28/07/1444 AH.
//

import SwiftUI

@main
struct DisplayPhotosApp: App {
    var body: some Scene {
        WindowGroup {
            PhotosListView(viewModel: PhotosListViewModel())
        }
    }
}
