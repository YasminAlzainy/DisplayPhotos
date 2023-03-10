//
//  PhotoView.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 01/08/1444 AH.
//

import SwiftUI

struct PhotoView: View {
    @State var photoInfo: PhotoInfoModel
    @Binding var loaddedPhotoList : [String:Image]
    
    var body: some View {
        AsyncImage(
            url: photoInfo.download_url){ phase in
                if let image = phase.image{
                    VStack{
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .mask(RoundedRectangle(cornerRadius: 16))
                            .onAppear{
                                loaddedPhotoList[photoInfo.id] = image
                            }
                        Text("Taken by: \(photoInfo.author)")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
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
