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
                                    NavigationLink(destination: TrailerWebView(model: MoviesModel(title: savedMovie.title!, tilteOverview: savedMovie.overview!))) {
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
                                            .frame(width: 120, height: 100)
                                        Spacer()
                                        Image(systemName: "play.circle")
                                            .padding()
                                            .font(.custom("", size: 40))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                viewModel.deleteMovie(indexSet: indexSet)
                            }
                        }
                        .padding(.init(.init(top: 0, leading: 34, bottom: 0, trailing: 34)))
                        .frame(width: 500)
                    }
            }
            .navigationBarTitle("Downloads")
        }
        .preferredColorScheme(.dark)
        .onAppear {
            viewModel.fetchMovies()
        }
        .onChange(of: viewModel.savedMovies) { _ in
            viewModel.fetchMovies()
        }
        .badge(viewModel.savedMovies.count)
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadsView()
    }
}
