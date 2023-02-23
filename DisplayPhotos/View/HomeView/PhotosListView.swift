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
                        
                        PhotoView(photoInfo: viewModel.photosList[index], loaddedPhotoList: $viewModel.loaddedPhotoList)
                            .onAppear(){
                                viewModel.loadMorePhotos(currentPhoto: viewModel.photosList[index])
                            }.onTapGesture {
                                viewModel.navigateToNextView(photoId: viewModel.photosList[index].id)
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

//struct PhotosListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            PhotosListView()
//                .PhotosListView(PreviewDevice(rawValue: deviceName))
//        }
//    }
//}
