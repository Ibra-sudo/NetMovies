//
//  UpcomingViewController.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 04.05.23.
//

import SwiftUI

struct UpcomingView: View {
    
    @StateObject var viewModel = ApiCaller()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.upcomingMovies) { title in
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
            }
            .navigationBarTitle("Upcoming")
        }
        .preferredColorScheme(.dark)
        .onAppear {
            viewModel.getUpcomingMovies()
        }
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
