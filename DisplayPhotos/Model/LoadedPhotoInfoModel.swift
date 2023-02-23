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
    let dominantColor : Color
    
    init(photoInfo: PhotoInfoModel, loadedImage: Image,dominantColor:Color ) {
        self.photoInfo = photoInfo
        self.loadedImage = loadedImage
        self.dominantColor = dominantColor
    }
    
    init(){
        photoInfo = PhotoInfoModel(id: "", author: "", width: 0, height: 0, url: URL(string: ""), download_url: URL(string: ""))
        loadedImage = Image("test".localize())
        self.dominantColor = .clear
    }
    
}
