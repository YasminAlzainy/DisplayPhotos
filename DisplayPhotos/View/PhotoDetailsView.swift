//
//  PhotoDetailsView.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 01/08/1444 AH.
//

import SwiftUI

struct PhotoDetailsView: View {
    @Binding var loadedPhotoInfo: LoadedPhotoInfoModel
    
    var body: some View {
        loadedPhotoInfo.loadedImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(RoundedRectangle(cornerRadius: 16))
            .padding()
        Text("Taken by: \(loadedPhotoInfo.photoInfo.author)")
            .font(.headline)
            .bold()
            .multilineTextAlignment(.center)
        
        
        Spacer()
    }
}
