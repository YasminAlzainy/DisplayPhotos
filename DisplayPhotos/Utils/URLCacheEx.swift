//
//  URLCacheEx.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 02/08/1444 AH.
//

import Foundation

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}
