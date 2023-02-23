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
    @ObservedObject private var viewModel = PhotoDetailsViewModel()
    
    var body: some View {
        VStack{
            Text(viewModel.showLoader ? "PleaseWait".localize() : " ")
                .font(.headline)
                .padding()
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
        .background(viewModel.backgroundColor)
        .onAppear {
            viewModel.loadBackgroundColor(loadedPhotoInfo: loadedPhotoInfo)
        }
    }
}


class PhotoDetailsViewModel: ObservableObject {
    @Published var backgroundColor : Color = .clear
    @Published var showLoader = true
    
    func loadBackgroundColor(loadedPhotoInfo: LoadedPhotoInfoModel) {
        DispatchQueue.main.async { [weak self] in
            let uiImage: UIImage = loadedPhotoInfo.loadedImage.asUIImage()
            let uiColor = uiImage.getColors()?.background ?? .black
            self?.backgroundColor = Color(uiColor)
            self?.showLoader = false
        }
    }
}
