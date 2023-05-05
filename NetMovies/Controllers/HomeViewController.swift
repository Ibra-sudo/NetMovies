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

struct HomeViewController: View {
    
//    @State private var isNavigationBarHidden = false

    //    @State private var randomTrendingMovie: Title?
        @State private var sectionTitles: [String] = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top rated"]
    //    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HeaderView()
                VStack(alignment: .leading) {
                    ForEach(0..<sectionTitles.count, id: \.self) { index in
                        Section(header: Text(sectionTitles[index].uppercased())){
                            //                        switch index {
                            //                        case Sections.TrendingMovies.rawValue: break
                            //
                            //                        case Sections.TrendingTv.rawValue: break
                            //
                            //                        case Sections.Popular.rawValue: break
                            //
                            //                        case Sections.Upcoming.rawValue: break
                            //
                            //                        case Sections.TopRated.rawValue: break
                            //
                            //                        default:
                            //                            EmptyView()
                            //                        }
                            
                        }
                        .padding()
                        
                        //                        .frame(height: 200)
                        //                        .foregroundColor(.white)
                        //                        .background(Color.green)
                        //    //                    .padding()
                        //                        .bold()
                        //                    .ignoresSafeArea(edges: .top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(0..<sectionTitles.count, id: \.self) { index in
                                    Text("\(index)")
                                        .padding()
                                        .frame(width: 130 ,height: 200)
                                        .background(Color.gray)
                                        .cornerRadius(5)
                                }
                            }
                        }
                        //
                    }
                }
                //                .position(x: 220, y: 1100)
                //                .frame(width: 400, height: 400)
                //                .clipped()
                //                padding()
                
                
                
            }
            //            .listStyle(GroupedListStyle())
            //            .ignoresSafeArea(edges: .top)
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
            
            //            .onAppear {
            //                self.isNavigationBarHidden = false
            //            }
            //            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            //                self.isNavigationBarHidden = false
            //            }
            //            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
            //
            //            }
            //            .onReceive(NotificationCenter.default.publisher(for: UIScrollView.keyboardDidHideNotification)) { _ in
            //                let topOffset = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
            //                let yOffset = abs(UIApplication.shared.windows.first?.rootViewController?.view.bounds.minY ?? 0) + topOffset
            //                self.isNavigationBarHidden = yOffset > topOffset // Change this threshold as needed
            //            }
            
        }
        .preferredColorScheme(.dark)
        
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView){
//        let defaultOffset = scrollView.safeAreaInsets.top
//        let offset = scrollView.contentOffset.y + defaultOffset
//
//        if let navigationController = self.navigationController {
//            navigationController.navigationBar.transform = CGAffineTransform(translationX: 0, y: min(0, -offset))
//        }
//
//    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewController()
    }
}


/*
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
     @StateObject private var viewModel = HomeViewModel()
     
     var body: some View {
         NavigationView {
             List {
                 headerView
                 ForEach(0..<sectionTitles.count, id: \.self) { index in
                     Section(header: Text(sectionTitles[index].uppercased())) {
                         switch index {
                         case Sections.TrendingMovies.rawValue:
                             TrendingMoviesSectionView(movies: viewModel.trendingMovies)
                         case Sections.TrendingTv.rawValue:
                             TrendingTVSectionView(movies: viewModel.trendingTV)
                         case Sections.Popular.rawValue:
                             PopularSectionView(movies: viewModel.popular)
                         case Sections.Upcoming.rawValue:
                             UpcomingSectionView(movies: viewModel.upcoming)
                         case Sections.TopRated.rawValue:
                             TopRatedSectionView(movies: viewModel.topRated)
                         default:
                             EmptyView()
                         }
                     }
                 }
             }
             .listStyle(GroupedListStyle())
             .navigationBarTitle("Netflix", displayMode: .inline)
             .navigationBarItems(
                 leading: Image("netflixLogo")
                     .resizable()
                     .frame(width: 20, height: 20),
                 trailing: HStack {
                     NavigationLink(destination: ProfileView()) {
                         Image(systemName: "person")
                             .imageScale(.large)
                     }
                     NavigationLink(destination: PlayView()) {
                         Image(systemName: "play.rectangle")
                             .imageScale(.large)
                     }
                 }
             )
         }
         .onAppear {
             viewModel.fetchData()
         }
     }
     
     var headerView: some View {
         HeroHeaderView(movie: $randomTrendingMovie)
             .frame(height: 500)
             .onAppear {
                 viewModel.getRandomTrendingMovie { title in
                     randomTrendingMovie = title
                 }
             }
     }
 }

 struct TrendingMoviesSectionView: View {
     let movies: [Title]
     
     var body: some View {
         CollectionView(movies: movies)
             .frame(height: 200)
     }
 }

 struct TrendingTVSectionView: View {
     let movies: [Title]
     
     var body: some View {
         CollectionView(movies: movies)
             .frame(height: 200)
     }
 }

 struct PopularSectionView: View {
     let movies: [Title]
     
     var body: some View {
         CollectionView(movies: movies)
             .frame(height: 200)
     }
 }

 struct UpcomingSectionView: View {
     let movies: [Title]
     
     var body: some View {
         CollectionView(movies: movies)
             .frame(height: 200)
     }
 }

 struct TopRatedSectionView: View {
     let movies: [Title]
     
     var body: some View {
         CollectionView(movies: movies)
             .frame(height: 200)
     }
 }

 struct CollectionView: View {
     let movies: [Title]
     
     var body: some View {
         ScrollView(.horizontal, showsIndicators: false) {
             LazyHStack(spacing: 16) {
                 ForEach(movies, id: \.id) { movie in
                     NavigationLink(destination: MovieDetailView(movie: movie))
 
 
 //////////////////////////////////////////////////
 
 import SwiftUI

 struct HomeView: View {
     
     @State private var randomTrendingMovie: Title?
     
     let sectionTitles: [String] = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top rated"]
     
     var body: some View {
         NavigationView {
             List {
                 Section(header: HeroHeaderUIView()) {
                     if let titleViewModel = TitleViewModel(titleName: randomTrendingMovie?.original_title ?? "", posterURL: randomTrendingMovie?.poster_path ?? "") {
                         HeroHeaderView(titleViewModel: titleViewModel)
                     }
                 }
                 
                 ForEach(Sections.allCases, id: \.self) { section in
                     Section(header: Text(sectionTitles[section.rawValue])) {
                         CollectionViewTableViewCell(section: section)
                             .frame(height: 200)
                     }
                 }
             }
             .listStyle(.grouped)
             .navigationBarTitle("", displayMode: .inline)
             .navigationBarItems(
                 leading: Image("netflixLogo")
                     .renderingMode(.original)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 40),
                 trailing:
                     HStack {
                         NavigationLink(destination: ProfileView()) {
                             Image(systemName: "person")
                         }
                         
                         NavigationLink(destination: PlayView()) {
                             Image(systemName: "play.rectangle")
                         }
                     }
             )
         }
     }
     
     private func getRandomTrendingMovie() {
         APICaller.shared.getTrendingMovies { [weak self] result in
             switch result {
             case .success(let titles):
                 let selectedTitle = titles.randomElement()
                 
                 self?.randomTrendingMovie = selectedTitle
                 
             case .failure(let error):
                 print(error.localizedDescription)
             }
         }
     }
     
     init() {
         getRandomTrendingMovie()
     }
 }


 struct CollectionViewTableViewCell: View {
     
     let section: Sections
     
     var body: some View {
         // Replace with your implementation
         EmptyView()
     }
 }


 protocol CollectionViewTableViewCellDelegate: AnyObject {
     func collectionViewTableViewCellDidTapCell(viewModel: TitlePreviewViewModel)
 }


 struct HeroHeaderView: View {
     
     let titleViewModel: TitleViewModel
     
     var body: some View {
         // Replace with your implementation
         EmptyView()
     }
 }


 struct HeroHeaderUIView: UIViewRepresentable {
     
     func makeUIView(context: Context) -> UIView {
         // Replace with your implementation
         UIView()
     }
     
     func updateUIView(_ uiView: UIView, context: Context) {
         // Replace with your implementation
     }
 }


 struct PlayView: View {
     var body: some View {
         // Replace with your implementation
         Text("Play View")
     }
 }


 struct ProfileView: View {
     var body: some View {
         // Replace with your implementation
         Text("Profile View")
     }
 }


 enum Sections: Int, CaseIterable {
     case TrendingMovies = 0
     case TrendingTv = 1
     case Popular = 2
     case Upcoming = 3
     case TopRated = 4
 }


 struct TitlePreviewViewModel {
     // Replace with your implementation
 }


 struct TitleViewModel {
     let titleName: String
     let posterURL: String
 }


 struct HomeView_Previews: PreviewProvider {
     static var previews: some View {
         HomeView()
     }
 }


 */
