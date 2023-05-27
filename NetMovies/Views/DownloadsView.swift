//
//  DownloadsViewController.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 04.05.23.
//

import SwiftUI

struct DownloadsView: View {
    
//    @StateObject var Model = ApiCaller()
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
//                ScrolView {
                    VStack(alignment: .leading) {
                        List{
                            ForEach(viewModel.savedMovies) { savedMovie in
                                HStack {
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(savedMovie.poster_path ?? "")")){ image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 140, height: 210)
                                            .cornerRadius(10)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(savedMovie.title ?? "")
                                        .padding()
                                        .font(.title)
                                        .frame(width: 150, height: 100)
                                    Spacer()
                                    NavigationLink(destination: TrailerWebView(model: MoviesModel(title: savedMovie.title!, tilteOverview: savedMovie.overview!))) {
                                    
                                    Image(systemName: "play.circle")
                                        .padding()
                                        .font(.custom("", size: 42))
                                        .foregroundColor(.white)
                                    }
                                    
                                }
                                .frame(width: 400)
                            }
                            .onDelete { indexSet in
                                
                                viewModel.deleteMovie(indexSet: indexSet)
                            }
                        }
                        .padding()
                        .frame(width: 500)
                    }
//                }
            }
            .navigationBarTitle("Downloads")
            
        }
        .preferredColorScheme(.dark)
        .onAppear{
            viewModel.fetchMovies()
//            print("savedMovie\(viewModel.savedMovies)")
        }
//        .onChange(of: viewModel.savedMovies) { _ in
//            viewModel.fetchMovies()
//        }
        .badge(viewModel.savedMovies.count)
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadsView()
    }
}
