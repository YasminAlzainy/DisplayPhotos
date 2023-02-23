//
//  PhotoModel.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 28/07/1444 AH.
//

import Foundation

struct PhotoInfoModel : Codable , Hashable{
    let id : String
    let author : String
    let width : Double
    let height : Double
    let url : URL?
    let download_url :URL?
}
