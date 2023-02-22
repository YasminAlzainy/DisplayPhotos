//
//  PhotoView.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 01/08/1444 AH.
//

import SwiftUI

struct PhotoView: View {
    @State var photoInfo: PhotoInfoModel
    
    var body: some View {
        AsyncImage(
            url: photoInfo.download_url){ phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .mask(RoundedRectangle(cornerRadius: 16))
                    Text("Taken by: \(photoInfo.author)")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }else if phase.error != nil {
                    Text("Error_ImageNotAvailable".localize())
                        .bold()
                        .font(.body)
                        .multilineTextAlignment(.center)
                }else {
                    ProgressView()
                        .font(.largeTitle)
                }
            }
        
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(photoInfo: PhotoInfoModel(id: "", author: "", width: 0, height: 0, url: URL(string: "")!, download_url: URL(string: "")!))
    }
}
