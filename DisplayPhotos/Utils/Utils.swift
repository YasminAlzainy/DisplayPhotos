//
//  Utils.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 28/07/1444 AH.
//

import Foundation

class Utils {
    static func createPhotosListURL(page: Int , limit: Int) -> URL? {
        let photosListURLString = URLConstans.photosListBaseURL + URLConstans.pageURL + "\(page)" + URLConstans.limitURL + "\(limit)"
        guard let photosListURL = URL(string:photosListURLString )else{
            return nil
        }
        return photosListURL
    }
}
