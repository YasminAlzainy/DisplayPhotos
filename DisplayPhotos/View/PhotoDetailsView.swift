//
//  PhotoDetailsView.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 01/08/1444 AH.
//

import SwiftUI
import UIImageColors

struct PhotoDetailsView: View {
    @Binding var loadedPhotoInfo: LoadedPhotoInfoModel
    @State private var backgroundColor: Color = .clear
    
    var body: some View {
        VStack{
            Spacer()
            loadedPhotoInfo.loadedImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask(RoundedRectangle(cornerRadius: 16))
                .padding()
            Text("Taken by: \(loadedPhotoInfo.photoInfo.author)")
                .font(.headline)
                .background(.white)
                .multilineTextAlignment(.center)
            Spacer()
        }
        
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            let uiImage: UIImage = loadedPhotoInfo.loadedImage.asUIImage()
            let uiColor = uiImage.getColors()?.background ?? .clear
            backgroundColor = Color(uiColor)
        }
        
    }
}
