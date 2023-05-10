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

        @State private var randomTrendingMovie: Title?
        @State private var sectionTitles: [String] = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top rated"]
        @StateObject var viewModel = ApiCaller()
    @State var i = 0
    var body: some View {
        NavigationStack {
            Text("\(i)")
            
            ScrollView {
                HeaderView()
                VStack(alignment: .leading) {
                    ForEach(0..<sectionTitles.count, id: \.self) { index in
                        Section(header: Text(sectionTitles[index].uppercased())){

                        }
                        .padding()

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                
//                                switch movies { title in
//                                    switch (sectionTitles.firstIndex(of: 0))
//                                        case
//                                }
                                ForEach(viewModel.movies) { movie in
//                                    VStack {
//                                        Text(movie.title ?? " ")
                                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.poster_path ?? " ") "
                                                            )){ image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 200, height: 200)

//                                    }
                                                                        
                                }
                                .task {
                                    i = i + 1
                                }
                            }
                        }
                        
                    }
                }
                
            }
            
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
        }
        
    }
    
    
    
    struct CollectionViewTableViewCell: View {
        
        let section: Sections
        
        var body: some View {
            // Replace with your implementation
            EmptyView()
        }
    }
    
    struct HeaderUIView: View {
        
        let titleViewModel: TitleViewModel
        
        var body: some View {
            // Replace with your implementation
            HeaderUIView(titleViewModel: titleViewModel)
        }
    }
    
    struct TitleViewModel {
        let titleName: String
        let posterURL: String
    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




