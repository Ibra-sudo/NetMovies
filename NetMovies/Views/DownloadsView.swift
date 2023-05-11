//
//  DownloadsViewController.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 04.05.23.
//

import SwiftUI

var array = [1,2,3,4,5,6,7,8,9]
struct DownloadsView: View {
    @StateObject var model = ApiCaller()
    var body: some View {
        Text("lal")
//        List {
//            ForEach(model.movies) { movie in
//                VStack {
//                    //                    Text(movie.title ?? " ")
//                    //                    Text(movie.original_title ?? " ")
//                    //                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.poster_path ?? " ")"
//                    //                                        )){ image in
//                    //                        image
//                    //                            .resizable()
//                    //                            .scaledToFit()
//                    //                            .frame(width: 200, height: 200)
//                    //                    } placeholder: {
//                    //                        ProgressView()
//                    //                    }
//                    //                    .frame(width: 200, height: 200)
//                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.poster_path ?? " ")")) { imagePhase in
//
//                        switch imagePhase {
//                        case .empty:
//                            ProgressView()
//                        case.success(let image):
//                            image
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 200, height: 200)
//                        case .failure:
//                            Image(systemName: "questionmark")
//                                .font(.headline)
//                        default:
//                            Image(systemName: "questionmark")
//                                .font(.headline)
//                        }
//                    }
//                }
//            }
//        }
//        .onAppear {
//            model.getTrendingMovies()
//        }
        
        
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadsView()
    }
}
