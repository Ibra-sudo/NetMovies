//
//  SwiftUIView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 04.05.23.
//

import SwiftUI

struct SearchView: View {
    
//    @State private var text: String = ""
//    @StateObject var viewModel = ApiCaller()
    
    var body: some View {
        NavigationStack {
            SearchTest()
        }
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
