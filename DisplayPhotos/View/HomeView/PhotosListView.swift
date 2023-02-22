//
//  PhotosListView.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 28/07/1444 AH.
//

import SwiftUI

struct PhotosListView: View {
    @ObservedObject var viewModel : PhotosListViewModel
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.photosList.indices , id: \.self) { index in
                        if index % 5 == 0 && index != 0{
                            Image("Image_Ad".localize())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(RoundedRectangle(cornerRadius: 16))
                                .padding()
                        }
                        PhotoView(photoInfo: viewModel.photosList[index])
                            .onAppear(){
                                viewModel.loadMorePhotos(currentPhoto: viewModel.photosList[index])
                            }.padding()
                        
                    }
                }
            }
            .padding()
            .navigationTitle("Title_Photos".localize())
        }
        
    }
}

struct PhotosListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosListView(viewModel: PhotosListViewModel())
    }
}

