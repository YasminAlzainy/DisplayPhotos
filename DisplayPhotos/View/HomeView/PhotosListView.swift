//
//  PhotosListView.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 28/07/1444 AH.
//

import SwiftUI

struct PhotosListView: View {
    @ObservedObject private var viewModel : PhotosListViewModel = PhotosListViewModel()
    
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
                        
                        Button(action: {
                            viewModel.navigateToNextView(photoId: viewModel.photosList[index].id)
                        }){
                            if(index <= 20){
                                CachedPhotoView(photoInfo: viewModel.photosList[index], loaddedPhotoList: $viewModel.loaddedPhotoList)
                                    .padding()
                                    .onAppear(){
                                        viewModel.loadMorePhotos(currentPhoto: viewModel.photosList[index])
                                    }
                            }else{
                                PhotoView(photoInfo: viewModel.photosList[index], loaddedPhotoList: $viewModel.loaddedPhotoList)
                                    .padding()
                                    .onAppear(){
                                        viewModel.loadMorePhotos(currentPhoto: viewModel.photosList[index])
                                    }
                            }
                            
                        }
                    }.background{
                        NavigationLink(destination: PhotoDetailsView(loadedPhotoInfo: $viewModel.currentLoadedPhotosInfo) , isActive: $viewModel.isShowingDetailView){EmptyView()}
                    }
                }
            }
            .padding()
            .navigationTitle("Title_Photos".localize())
        }
        
    }
}
