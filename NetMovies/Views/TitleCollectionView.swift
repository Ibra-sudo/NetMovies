//
//  TitleCollectionView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 08.05.23.
//

import SwiftUI

struct TitleCollectionView: View {
    
    let model: String
    
    var body: some View {
        Text("TitleCollection")
//        Image(URL(string: "https://image.tmdb.org/t/p/w500/\(model)"))
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .clipped()
            
    }
}

struct TitleCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TitleCollectionView(model: "imageURL")
            .frame(width: 100, height: 150)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
