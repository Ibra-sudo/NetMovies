//
//  SwiftUIView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 04.05.23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var text: String = ""
    @State private var isEmptyList: Bool = false 
    @StateObject var viewModel = ApiCaller()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                if isEmptyList {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(viewModel.trendingMovies) { title in
                                HStack {
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(title.poster_path ?? "")")){ image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 140, height: 210)
                                                .cornerRadius(10)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(title.title ?? "")
                                        .padding()
                                        .font(.title)
                                        .frame(width: 150, height: 100)
                                    Spacer()
                                    NavigationLink(destination: TrailerWebView(model: MoviesModel(title: title.title!, tilteOverview: title.overview!))) {
                                        
                                        Image(systemName: "play.circle")
                                            .padding()
                                            .font(.custom("", size: 42))
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                                .frame(width: 360)
                            }
                        }.padding()
                    }
                } else {
                    ScrollView() {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.titles) { title in
                                VStack {
                                    NavigationLink(destination: TrailerWebView(model: MoviesModel(title: title.title!, tilteOverview: title.overview!))) {
                                        
                                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(title.poster_path ?? "")")){ image in
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 140, height: 215)
                                                    .cornerRadius(10)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Search")
        }
        .preferredColorScheme(.dark)
        .searchable(text: $text, prompt: "Search for a Movie or Tv show")
        .onAppear {
            if text.isEmpty {
                viewModel.getTrendingMovies()
                self.isEmptyList = true
            } else {
                viewModel.search(with: text)
                self.isEmptyList = false
            }
        }
        .onChange(of: text) { _ in
            if text.isEmpty {
                viewModel.getTrendingMovies()
                self.isEmptyList = true
            } else {
                viewModel.search(with: text)
                self.isEmptyList = false
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
