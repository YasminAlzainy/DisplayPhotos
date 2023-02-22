//
//  NetworkRequests.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 28/07/1444 AH.
//

import Foundation

class PhotosListService {
    static func fetchPhotos(page : Int , limit: Int , completionHandler : @escaping (Result<[PhotoInfoModel] , NetworkError>) -> Void) {
        
        guard let photosURL = Utils.createPhotosListURL(page:page , limit: limit) else {
            print("error: \(NetworkError.badURL)")
            completionHandler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: photosURL) { data, response, error in
            if let error = error {
                print("urlSession error: \(error.localizedDescription)")
                completionHandler(.failure(.serverError))
                return
            }
            
            guard let data = data else{
                print("urlSession error data = nil")
                completionHandler(.failure(.invalidData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([PhotoInfoModel].self, from: data)
                DispatchQueue.main.async {
                    print("fetch photos successed")
                    completionHandler(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    print("urlSession error: \(error)")
                    completionHandler(.failure(.invalidData))
                    return
                }
            }
            
        }.resume()
    }
}
