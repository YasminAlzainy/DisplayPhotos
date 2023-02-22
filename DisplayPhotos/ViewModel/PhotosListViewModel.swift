//
//  PhotosListViewModel.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 28/07/1444 AH.
//

import Foundation

class PhotosListViewModel: ObservableObject {
    @Published var photosList : [PhotoInfoModel]
    private let limit : Int
    private var page : Int
    private var photosInfoListFull : Bool
    
    init() {
        self.photosList = [PhotoInfoModel]()
        self.limit = 10
        self.page = 1
        self.photosInfoListFull = false
        
        self.fetchPhotosList()
    }
    
    func loadMorePhotos(currentPhoto : PhotoInfoModel) {
        let lastPhotoId = self.photosList.last?.id
        if lastPhotoId == currentPhoto.id, !photosInfoListFull {
            page += 1
            self.fetchPhotosList()
        }
    }
}


private extension PhotosListViewModel{
    func fetchPhotosList(){
        PhotosListService.fetchPhotos(page: page, limit: limit) { [weak self] result in
            switch result {
            case .success(let photosListResult):
                self?.handleFetchPhotosSuccess(photosListResult: photosListResult)
            case .failure(let error):
                self?.handleFetchPhotosFailure(error: error)
            }
        }
    }
    
    func handleFetchPhotosSuccess(photosListResult : [PhotoInfoModel])  {
        print("handleFetchPhotosSuccess photosInfoList:\(photosListResult)")
        page += 1
        if photosListResult.count == 0{
            photosInfoListFull = true
        }
        self.photosList.append(contentsOf: photosListResult)
    }
    
    func handleFetchPhotosFailure(error : NetworkError)  {
        print("handleFetchPhotosFailure error:\(error)")
        
    }
}
