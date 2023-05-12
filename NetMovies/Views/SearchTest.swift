//
//  SearchTest.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 12.05.23.
//

import SwiftUI

struct SearchTest: View {
    
    @State private var text: String = ""
    @StateObject var viewModel = ApiCaller()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                List(viewModel.titles) { title in
                    
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("Search")
//            .navigationBarItems.(leading: view)
        }
        .preferredColorScheme(.dark)
        .searchable(text: $text, prompt: "Search")
    }
}

struct SearchTest_Previews: PreviewProvider {
    static var previews: some View {
        SearchTest()
    }
}
