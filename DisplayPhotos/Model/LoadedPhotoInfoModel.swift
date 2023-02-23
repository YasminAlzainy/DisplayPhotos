//
//  LoadedPhotoInfoModel.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 03/08/1444 AH.
//

import Foundation
import SwiftUI

struct LoadedPhotoInfoModel {
    let photoInfo : PhotoInfoModel
    let loadedImage : Image
    
    init(photoInfo: PhotoInfoModel, loadedImage: Image) {
        self.photoInfo = photoInfo
        self.loadedImage = loadedImage
    }
    
    init(){
        photoInfo = PhotoInfoModel(id: "", author: "", width: 0, height: 0, url: URL(string: ""), download_url: URL(string: ""))
        loadedImage = Image("test".localize())
    }
    
}
