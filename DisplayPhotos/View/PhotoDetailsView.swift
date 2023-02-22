//
//  PhotoDetailsView.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 01/08/1444 AH.
//

import SwiftUI

struct PhotoDetailsView: View {
    @State var photoInfo: PhotoInfoModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PhotoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailsView(photoInfo: PhotoInfoModel(id: "", author: "", width: 0, height: 0, url: URL(string: "")!, download_url: URL(string: "")!))
    }
}
