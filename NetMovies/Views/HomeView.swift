//
//  HomeScreen.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 04.05.23.
//

import SwiftUI

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

struct HomeView: View {

//    @State private var randomTrendingMovie: Title?
//    @State var model = MoviesViewModel(title: "Superman", youtubeView: VideoElement(id: IdVideoElement(kind: "", videoId: "")), tilteOverview: "")
//    let model: MoviesViewModel
    @State private var text = ""
    @State private var sectionTitles: [String] = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top rated"]
    @StateObject var viewModel = ApiCaller()
    @State private var isShowingHeaderImage = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HeaderView(toggleShowingHeaderImage: .constant(isShowingHeaderImage), model: MoviesViewModel(title: "", tilteOverview: ""))
                VStack(alignment: .leading) {
                    ForEach(0..<sectionTitles.count, id: \.self) { index in
                        Section(header: Text(sectionTitles[index].capitalized)){
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    
                                    switch index {
                                        
                                    case Sections.TrendingMovies.rawValue:
                                        ForEach(viewModel.trendingMovies) { movie in
//                                            NavigationLink(destination: TrailerWebView(model: MoviesViewModel(title: movie.title!, tilteOverview: movie.overview!)))
//                                                {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.poster_path ?? "")")){ image in
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 160, height: 240)
                                                            .cornerRadius(10)
                                                            .onTapGesture {
//                                                                HeaderView(isShowingHeaderImage: $toggleShowingHeaderImage, model: MoviesViewModel(title: "Hulk", tilteOverview: ""))
                                                                isShowingHeaderImage = true
                                                            }
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                                
//                                            }
                                            
                                        }
                                        
                                    case Sections.TrendingTv.rawValue:
                                        ForEach(viewModel.trendingTv) { tv in
                                            NavigationLink(destination: TrailerWebView(model: MoviesViewModel(title: tv.title ?? "", tilteOverview: tv.overview!))) {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(tv.poster_path ?? "")")){ image in
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 160, height: 240)
                                                            .cornerRadius(10)
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                        }

                                    case Sections.Popular.rawValue:
                                        ForEach(viewModel.popularMovies) { popular in
                                            NavigationLink(destination: TrailerWebView(model: MoviesViewModel(title: popular.title!, tilteOverview: popular.overview!))) {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(popular.poster_path ?? "")")){ image in
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 160, height: 240)
                                                            .cornerRadius(10)
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }

                                        }

                                    case Sections.Upcoming.rawValue:
                                        ForEach(viewModel.upcomingMovies) { upcoming in
                                            NavigationLink(destination: TrailerWebView(model: MoviesViewModel(title: upcoming.title!, tilteOverview: upcoming.overview!))) {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(upcoming.poster_path ?? "")")){ image in
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 160, height: 240)
                                                            .cornerRadius(10)
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }

                                        }
                                        
                                    case Sections.TopRated.rawValue:
                                        ForEach(viewModel.topRatedMovies) { topRate in
                                            NavigationLink(destination: TrailerWebView(model: MoviesViewModel(title: topRate.title!, tilteOverview: topRate.overview!))) {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(topRate.poster_path ?? "")")){ image in
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 160, height: 240)
                                                            .cornerRadius(10)
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }

                                        }
                                        
                                    default:
                                        EmptyView()
                                    }
                                }
                            }
                        }
                        .padding(.init(.init(top: 15, leading: 0, bottom: 0, trailing: 0)))
                        .font(.title2)
                    }
                }
            }
//            .navigationTitle("NetMovies")
//            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("NetMovies", displayMode: .inline)
            .navigationBarItems(
                leading: Image("Logo")
                    .resizable()
                    .cornerRadius(100)
                    .frame(width: 30, height: 30),
                trailing: HStack {
                    NavigationLink(destination: PlayView()) {
                        Image(systemName: "play.rectangle")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }

                }
            )
            
        }
        .preferredColorScheme(.dark)
        .onAppear{
            viewModel.getTrendingMovies()
            viewModel.getTrendingTvs()
            viewModel.getPopularMovies()
            viewModel.getUpcomingMovies()
            viewModel.getTopRatedMovies()
        }
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
