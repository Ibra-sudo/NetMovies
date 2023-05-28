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
    
    @StateObject var progressBar: DynamicProgress = .init()
    @State var sampleProgress: CGFloat = 0

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
                                                                        progressBar.removeProgressWithAnimations()

                                                                        itemExist = true
                                                                    } else {
                                                                        let config = ProgressConfig(title: movie.title!, progressImage: "arrow.up", expandedImage: "clock.badge.checkmark.fill", tint: .yellow, rotationEnabeld: false)
                                                                        progressBar.addProgressView(config: config)
                                                                        
                                                                        movieViewModel.saveMovies(id: Int64(movie.id), title: movie.title!, media_type: movie.media_type!, original_title: movie.original_title!, poster_path: movie.poster_path!, overview: movie.overview!, vote_count: Int64(movie.vote_count), relase_date: movie.relase_date ?? "", vote_average: Double(movie.vote_average))
                                                                        
                                                                        print("Its downloaded")
                                                                    }
                                                                    
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                                .onReceive(Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()) { _ in
                                                                    if progressBar.isAdded {
                                                                        sampleProgress += 0.3
                                                                        progressBar.updateProgressView(to: sampleProgress / 100)
                                                                    } else {
                                                                        sampleProgress = 0
                                                                    }
                                                                }
                                                                .statusBarHidden(progressBar.hideStatusBar)
                                                                
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
                                                                        progressBar.removeProgressWithAnimations()
                                                                        itemExist = true
                                                                    } else {
                                                                        let config = ProgressConfig(title: tv.title ?? "", progressImage: "arrow.up", expandedImage: "clock.badge.checkmark.fill", tint: .yellow, rotationEnabeld: false)
                                                                        progressBar.addProgressView(config: config)
                                                                        
                                                                        movieViewModel.saveMovies(id: Int64(tv.id), title: tv.title ?? "", media_type: tv.media_type!, original_title: tv.original_title ?? "", poster_path: tv.poster_path!, overview: tv.overview!, vote_count: Int64(tv.vote_count), relase_date: tv.relase_date ?? "", vote_average: Double(tv.vote_average))
                                                                        print("Its downloaded")
                                                                    }
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                                .onReceive(Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()) { _ in
                                                                    if progressBar.isAdded {
                                                                        sampleProgress += 0.3
                                                                        progressBar.updateProgressView(to: sampleProgress / 100)
                                                                    } else {
                                                                        sampleProgress = 0
                                                                    }
                                                                }
                                                                .statusBarHidden(progressBar.hideStatusBar)
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
                                                                        progressBar.removeProgressWithAnimations()
                                                                        itemExist = true
                                                                    } else {
                                                                        let config = ProgressConfig(title: popular.title!, progressImage: "arrow.up", expandedImage: "clock.badge.checkmark.fill", tint: .yellow, rotationEnabeld: false)
                                                                        progressBar.addProgressView(config: config)
                                                                        
                                                                        movieViewModel.saveMovies(id: Int64(popular.id), title: popular.title!, media_type: popular.media_type ?? "", original_title: popular.original_title!, poster_path: popular.poster_path!, overview: popular.overview!, vote_count: Int64(popular.vote_count), relase_date: popular.relase_date ?? "", vote_average: Double(popular.vote_average))
                                                                        print("Its downloaded")
                                                                    }
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                                .onReceive(Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()) { _ in
                                                                    if progressBar.isAdded {
                                                                        sampleProgress += 0.3
                                                                        progressBar.updateProgressView(to: sampleProgress / 100)
                                                                    } else {
                                                                        sampleProgress = 0
                                                                    }
                                                                }
                                                                .statusBarHidden(progressBar.hideStatusBar)
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
                                                                        progressBar.removeProgressWithAnimations()
                                                                        itemExist = true
                                                                    } else {
                                                                        let config = ProgressConfig(title: upcoming.title!, progressImage: "arrow.up", expandedImage: "clock.badge.checkmark.fill", tint: .yellow, rotationEnabeld: false)
                                                                        progressBar.addProgressView(config: config)
                                                                        
                                                                        movieViewModel.saveMovies(id: Int64(upcoming.id), title: upcoming.title!, media_type: upcoming.media_type ?? "", original_title: upcoming.original_title!, poster_path: upcoming.poster_path!, overview: upcoming.overview!, vote_count: Int64(upcoming.vote_count), relase_date: upcoming.relase_date ?? "", vote_average: Double(upcoming.vote_average))
                                                                        print("Its downloaded")
                                                                    }
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                                .onReceive(Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()) { _ in
                                                                    if progressBar.isAdded {
                                                                        sampleProgress += 0.3
                                                                        progressBar.updateProgressView(to: sampleProgress / 100)
                                                                    } else {
                                                                        sampleProgress = 0
                                                                    }
                                                                }
                                                                .statusBarHidden(progressBar.hideStatusBar)
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
                                                                        progressBar.removeProgressWithAnimations()
                                                                        itemExist = true
                                                                    } else {
                                                                        let config = ProgressConfig(title: topRate.title!, progressImage: "arrow.up", expandedImage: "clock.badge.checkmark.fill", tint: .yellow, rotationEnabeld: false)
                                                                        progressBar.addProgressView(config: config)
                                                                        
                                                                        movieViewModel.saveMovies(id: Int64(topRate.id), title: topRate.title!, media_type: topRate.media_type ?? "", original_title: topRate.original_title!, poster_path: topRate.poster_path!, overview: topRate.overview!, vote_count: Int64(topRate.vote_count), relase_date: topRate.relase_date ?? "", vote_average: Double(topRate.vote_average))
                                                                        print("Its downloaded")
                                                                    }
                                                                }) {
                                                                    Label("Download", systemImage: "tray.and.arrow.down")
                                                                        
                                                                }
                                                                .onReceive(Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()) { _ in
                                                                    if progressBar.isAdded {
                                                                        sampleProgress += 0.3
                                                                        progressBar.updateProgressView(to: sampleProgress / 100)
                                                                    } else {
                                                                        sampleProgress = 0
                                                                    }
                                                                }
                                                                .statusBarHidden(progressBar.hideStatusBar)
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

struct DynamicProgressView: View {
    
    var config: ProgressConfig
    @EnvironmentObject var progressBar: DynamicProgress
    
    @State var showProgressView: Bool = false
    @State var progress: CGFloat = 0
    @State var showAlertView: Bool = false
    
    var body: some View{
        Canvas { ctx, size in
            ctx.addFilter(.alphaThreshold(min: 0.5, color: .black))
            ctx.addFilter(.blur(radius: 5.5))
            
            ctx.drawLayer { context in
                for index in [1, 2] {
                    if let resolvedImage = ctx.resolveSymbol(id: index) {
                        context.draw(resolvedImage, at: CGPoint(x: size.width / 2, y: 11 + 18))
                    }
                }
            }
        } symbols: {
            ProgressComponents()
                .tag(1)
            ProgressComponents(isCircle: true)
                .tag(2)
        }
        .overlay(alignment: .top, content: {
            ProgressView()
                .offset(y: 11)
        })
        .overlay(alignment: .top, content: {
            CustomAlertView()
        })
        .ignoresSafeArea()
        .allowsHitTesting(false)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                showProgressView = true
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .init("CLOSE_PROGRESS_VIEW")), perform: { _ in
            showProgressView = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                progressBar.removeProgressView()
            }
        })
        .onReceive(NotificationCenter.default.publisher(for: .init("UPDATE_PROGRESS"))) { output in
            if let info = output.userInfo, let progress = info["progress"] as? CGFloat {
                if progress < 1.0 {
                    self.progress = progress
                    
                    if (progress * 100).rounded() == 100.0 {
                        showProgressView = false
                        showAlertView = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            progressBar.hideStatusBar = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showAlertView = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                progressBar.hideStatusBar = false
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                progressBar.removeProgressView()
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func CustomAlertView() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            Capsule()
                .fill(.black)
                .frame(width: showAlertView ? size.width : 125, height: showAlertView ? size.height : 35)
                .overlay(content: {
                    HStack(spacing: 13) {
                        Image(systemName: config.expandedImage)
                            .symbolRenderingMode(.multicolor)
                            .font(.largeTitle)
                            .foregroundStyle(.white, .blue, .white)
                        
                        HStack(spacing: 6) {
                            Text("Downloaded")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(config.title)
                                .font(.system(size: 13))
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        }
                        .lineLimit(1)
                        .contentTransition(.opacity)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: 12)
                    }
                    .padding(.horizontal, 12)
                    .blur(radius: showAlertView ? 0 : 5)
                    .opacity(showAlertView ? 1 : 0)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//                .contentTransition(.opacity)
        }
        .frame(height: 65)
        .padding(.horizontal, 18)
        .offset(y: 12)
        .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7).delay(showAlertView ? 0.35 : 0), value: showAlertView)
    }
    
    @ViewBuilder
    func ProgressView() -> some View {
        ZStack{
            
            let rotation = (progress > 1 ? 1 : (progress < 0 ? 0 : progress))
            Image(systemName: config.progressImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 12, height: 12)
                .fontWeight(.semibold)
                .foregroundColor(config.tint)
                .rotationEffect(.init(degrees: config.rotationEnabeld ? Double(rotation * 360) : 0 ))
            
            ZStack {
                Circle()
                    .stroke(.white.opacity(0.25), lineWidth: 4)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(config.tint, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.init(degrees: -90))
            }
            .frame(width: 23, height: 23)
        }
        .frame(width: 37, height: 37)
        .frame(width: 126, alignment: .trailing)
        .offset(x: showProgressView ? 45 : 0)
        .opacity(showProgressView ? 1 : 0)
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: showProgressView)
    }
    
    @ViewBuilder
    func ProgressComponents(isCircle: Bool = false) -> some View {
        if isCircle {
            Circle()
                .fill(.black)
                .frame(width: 37, height: 37)
                .frame(width: 126, alignment: .trailing)
                .offset(x: showProgressView ? 45 : 0)
                .scaleEffect(showProgressView ? 1 : 0.55, anchor: .trailing)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: showProgressView)
        } else {
            Capsule()
                .fill(.black)
                .frame(width: 126, height: 36)
                .offset(y: 1)
        }
    }
}

