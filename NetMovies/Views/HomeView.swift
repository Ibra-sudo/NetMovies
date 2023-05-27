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
    @State private var sectionTitles: [String] = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top rated"]
    @StateObject var viewModel = ApiCaller()
    @StateObject var movieViewModel = MoviesViewModel()
    @State private var isShowingHeaderImage = false
    @State private var newImage = Image("spiderman-header-image")
    @State private var itemExist = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HeaderView(toggleShowingHeaderImage: .constant(isShowingHeaderImage), newImage: .constant(newImage), model: MoviesModel(title: "", tilteOverview: ""))
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
                                                            .contextMenu {
                                                                Button(action: {
                                                                    if movieViewModel.savedMovies.contains(where: { $0.title == movie.title! }) {
                                                                        print("its exist")
                                                                        itemExist = true
                                                                    } else {
                                                                        movieViewModel.saveMovies(id: Int64(movie.id), title: movie.title!, media_type: movie.media_type!, original_title: movie.original_title!, poster_path: movie.poster_path!, overview: movie.overview!, vote_count: Int64(movie.vote_count), relase_date: movie.relase_date ?? "", vote_average: Double(movie.vote_average))
                                                                        print("Its downloaded")
                                                                    }
                                                                    
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                            }
                                                            .alert(isPresented: $itemExist) {
                                                                Alert(title: Text("This movie already downloaded"), message: Text("The movie \(movie.title!) already exist in the downloads!"), dismissButton: .default(Text("OK")))
                                                            }
                                                            .onTapGesture {
                                                                
//                                                                HeaderView(toggleShowingHeaderImage: $isShowingHeaderImage, newImage: $newImage, model: MoviesModel(title: movie.title!, tilteOverview: movie.overview!))
                                                                isShowingHeaderImage = true
                                                                newImage = image
                                                            }
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                                
//                                            }
                                            
                                        }
                                        
                                    case Sections.TrendingTv.rawValue:
                                        ForEach(viewModel.trendingTv) { tv in
                                            NavigationLink(destination: TrailerWebView(model: MoviesModel(title: tv.title ?? "", tilteOverview: tv.overview!))) {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(tv.poster_path ?? "")")){ image in
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 160, height: 240)
                                                            .cornerRadius(10)
                                                            .contextMenu {
                                                                Button(action: {
                                                                    if movieViewModel.savedMovies.contains(where: { $0.title == tv.title ?? "" }) {
                                                                        print("its exist")
                                                                        itemExist = true
                                                                    } else {
                                                                        movieViewModel.saveMovies(id: Int64(tv.id), title: tv.title ?? "", media_type: tv.media_type!, original_title: tv.original_title ?? "", poster_path: tv.poster_path!, overview: tv.overview!, vote_count: Int64(tv.vote_count), relase_date: tv.relase_date ?? "", vote_average: Double(tv.vote_average))
                                                                        print("Its downloaded")
                                                                    }
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                            }
                                                            .alert(isPresented: $itemExist) {
                                                                Alert(title: Text("This movie already downloaded"), message: Text("The movie \(tv.title ?? "") already exist in the downloads!"), dismissButton: .default(Text("OK")))
                                                            }
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                        }

                                    case Sections.Popular.rawValue:
                                        ForEach(viewModel.popularMovies) { popular in
                                            NavigationLink(destination: TrailerWebView(model: MoviesModel(title: popular.title!, tilteOverview: popular.overview!))) {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(popular.poster_path ?? "")")){ image in
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 160, height: 240)
                                                            .cornerRadius(10)
                                                            .contextMenu {
                                                                Button(action: {
                                                                    if movieViewModel.savedMovies.contains(where: { $0.title == popular.title! }) {
                                                                        print("its exist")
                                                                        itemExist = true
                                                                    } else {
                                                                        movieViewModel.saveMovies(id: Int64(popular.id), title: popular.title!, media_type: popular.media_type ?? "", original_title: popular.original_title!, poster_path: popular.poster_path!, overview: popular.overview!, vote_count: Int64(popular.vote_count), relase_date: popular.relase_date ?? "", vote_average: Double(popular.vote_average))
                                                                        print("Its downloaded")
                                                                    }
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                            }
                                                            .alert(isPresented: $itemExist) {
                                                                Alert(title: Text("This movie already downloaded"), message: Text("The movie \(popular.title!) already exist in the downloads!"), dismissButton: .default(Text("OK")))
                                                            }
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }

                                        }

                                    case Sections.Upcoming.rawValue:
                                        ForEach(viewModel.upcomingMovies) { upcoming in
                                            NavigationLink(destination: TrailerWebView(model: MoviesModel(title: upcoming.title!, tilteOverview: upcoming.overview!))) {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(upcoming.poster_path ?? "")")){ image in
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 160, height: 240)
                                                            .cornerRadius(10)
                                                            .contextMenu {
                                                                Button(action: {
                                                                    if movieViewModel.savedMovies.contains(where: { $0.title == upcoming.title! }) {
                                                                        print("its exist")
                                                                        itemExist = true
                                                                    } else {
                                                                        movieViewModel.saveMovies(id: Int64(upcoming.id), title: upcoming.title!, media_type: upcoming.media_type ?? "", original_title: upcoming.original_title!, poster_path: upcoming.poster_path!, overview: upcoming.overview!, vote_count: Int64(upcoming.vote_count), relase_date: upcoming.relase_date ?? "", vote_average: Double(upcoming.vote_average))
                                                                        print("Its downloaded")
                                                                    }
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                            }
                                                            .alert(isPresented: $itemExist) {
                                                                Alert(title: Text("This movie already downloaded"), message: Text("The movie \(upcoming.title!) already exist in the downloads!"), dismissButton: .default(Text("OK")))
                                                            }
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }

                                        }
                                        
                                    case Sections.TopRated.rawValue:
                                        ForEach(viewModel.topRatedMovies) { topRate in
                                            NavigationLink(destination: TrailerWebView(model: MoviesModel(title: topRate.title!, tilteOverview: topRate.overview!))) {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(topRate.poster_path ?? "")")){ image in
                                                        image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 160, height: 240)
                                                            .cornerRadius(10)
                                                            .contextMenu {
                                                                Button(action: {
                                                                    if movieViewModel.savedMovies.contains(where: { $0.title == topRate.title! }) {
                                                                        print("its exist")
                                                                        itemExist = true
                                                                    } else {
                                                                        movieViewModel.saveMovies(id: Int64(topRate.id), title: topRate.title!, media_type: topRate.media_type ?? "", original_title: topRate.original_title!, poster_path: topRate.poster_path!, overview: topRate.overview!, vote_count: Int64(topRate.vote_count), relase_date: topRate.relase_date ?? "", vote_average: Double(topRate.vote_average))
                                                                        print("Its downloaded")
                                                                    }
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                            }
                                                            .alert(isPresented: $itemExist) {
                                                                Alert(title: Text("This movie already downloaded"), message: Text("The movie \(topRate.original_title!) already exist in the downloads!"), dismissButton: .default(Text("OK")))
                                                            }
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

