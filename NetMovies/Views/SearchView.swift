//
//  SwiftUIView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 04.05.23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var text: String = ""
//    var arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59]
    @StateObject var viewModel = ApiCaller()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.trendingMovies) { item in
                            HStack {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(item.poster_path ?? "")")){ image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 140, height: 210)
                                            .cornerRadius(10)
                                } placeholder: {
                                    ProgressView()
                                }
                                Text(item.title ?? "")
                                    .padding()
                                    .font(.title)
                                    .frame(width: 180, height: 100)
                                Spacer()
                                Image(systemName: "play.circle")
                                    .padding()
                                    .font(.largeTitle)
                            }
                        }
                    }.padding()
                }
            }
            .navigationBarTitle("Search")
//            .navigationBarItems.(leading: view)
        }
        .onAppear {
//            viewModel.search(with: "Jack+Reacher")
            viewModel.getTrendingMovies()
        }
        .preferredColorScheme(.dark)
        .searchable(text: $text, prompt: "Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


/*
 import SwiftUI

 struct SearchView: View {
     @StateObject private var viewModel = SearchViewModel()
     
     var body: some View {
         NavigationView {
             VStack {
                 List(viewModel.titles, id: \.id) { title in
                     NavigationLink(destination: TitlePreviewView(viewModel: TitlePreviewViewModel(title: title))) {
                         TitleTableViewCell(viewModel: TitleViewModel(title: title))
                     }
                 }
                 .listStyle(PlainListStyle())
             }
             .navigationBarTitle("Search")
             .navigationBarItems(trailing: SearchBarView(text: $viewModel.searchQuery))
         }
         .onAppear {
             viewModel.fetchDiscoverMovies()
         }
     }
 }

 struct TitleTableViewCell: View {
     let viewModel: TitleViewModel
     
     var body: some View {
         HStack {
             // Configure the cell UI using the TitleViewModel properties
         }
         .frame(height: 140)
     }
 }

 struct TitlePreviewView: View {
     let viewModel: TitlePreviewViewModel
     
     var body: some View {
         // Configure the preview view UI using the TitlePreviewViewModel properties
     }
 }

 struct SearchBarView: View {
     @Binding var text: String
     
     var body: some View {
         SearchBar(text: $text, placeholder: "Search for a Movie or a Tv show")
             .frame(width: 300)
     }
 }

 struct SearchView_Previews: PreviewProvider {
     static var previews: some View {
         SearchView()
     }
 }

*/
