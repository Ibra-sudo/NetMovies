//
//  PlayView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 05.05.23.
//

import SwiftUI

struct PlayView: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4"]
    var body: some View {
        ScrollView {
                   VStack(spacing: 0) {
                       ForEach(items, id: \.self) { item in
//                           Sections(header: Text(items[item])){
//
//                           }
                           VStack {
//                               Text(item)
//                                   .font(.headline)
//                                   .padding()
                               
                               ScrollView(.horizontal, showsIndicators: false) {
                                   HStack(spacing:10) {
                                       ForEach(0..<10) { index in
                                           Text("\(item) \(index)")
                                               .padding()
                                               .frame(width: 100 ,height: 190)
                                               .background(Color.gray)
                                               .cornerRadius(5)
                                       }
                                   }
                                   .padding(.horizontal)
                               }
                               .frame(height: 200)
                           }
                           .background(Color.white)
                           .cornerRadius(10)
                           .shadow(radius: 1)
                           .padding()
                       }
                   }
               }
           }
    }


struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
