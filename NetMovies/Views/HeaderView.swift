//
//  HeaderView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 05.05.23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
//        GeometryReader { geometry in
        NavigationStack{
            ZStack(alignment: .bottom) {
                Image("spiderman-header-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 430, height: 450)
//                    .position(x: 215, y: 290)
                    .clipped()
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
//                        .frame(height: geometry.size.height / 1.5)
//                        .clipped()
                        .opacity(0.8)
//                        .ignoresSafeArea(edges: .top)
                    )
                HStack(spacing: 80) {
                    Button( action: {
                        //Play action
                    }) {
                        Text("Play")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 120, height: 40)
                            .background(Color.clear)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
//                    Spacer()
                    Button( action: {
                        //Download action
                    }) {
                        Text("Download")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 120, height: 40)
                            .background(Color.clear)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
//                .padding(.horizontal, 0)
//                .padding(.bottom, 50)
            }
            .ignoresSafeArea(edges: .top)
            Spacer()
                

        }
        
//            .frame(height: 700)
            
//        }
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}


/*
 import SwiftUI

 struct HeroHeaderView: View {
     
     let model: TitleViewModel
     
     var body: some View {
         GeometryReader { geometry in
             ZStack(alignment: .bottom) {
                 AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)")!) { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fill)
                 } placeholder: {
                     Color.gray
                 }
                 .frame(width: geometry.size.width, height: geometry.size.height)
                 .clipped()
                 .overlay(
                     LinearGradient(
                         gradient: Gradient(colors: [.clear, .systemBackground]),
                         startPoint: .top,
                         endPoint: .bottom
                     )
                     .frame(height: geometry.size.height / 3)
                     .clipped()
                     .opacity(0.8)
                     .ignoresSafeArea(edges: .top)
                 )
                 
                 HStack(spacing: 20) {
                     Button(action: {
                         // Download action
                     }) {
                         Text("Download")
                             .fontWeight(.semibold)
                             .padding()
                             .frame(width: 120)
                             .background(Color.white)
                             .cornerRadius(5)
                             .overlay(
                                 RoundedRectangle(cornerRadius: 5)
                                     .stroke(Color.white, lineWidth: 1)
                             )
                     }
                     
                     Button(action: {
                         // Play action
                     }) {
                         Text("Play")
                             .fontWeight(.semibold)
                             .padding()
                             .frame(width: 120)
                             .background(Color.white)
                             .cornerRadius(5)
                             .overlay(
                                 RoundedRectangle(cornerRadius: 5)
                                     .stroke(Color.white, lineWidth: 1)
                             )
                     }
                 }
                 .frame(maxWidth: .infinity)
                 .padding(.horizontal, 70)
                 .padding(.bottom, 50)
             }
         }
         .ignoresSafeArea(edges: .top)
     }
 }

 struct HeroHeaderView_Previews: PreviewProvider {
     static var previews: some View {
         HeroHeaderView(model: TitleViewModel(posterURL: "heroImage"))
     }
 }

 struct AsyncImage<Placeholder: View>: View {
     @StateObject private var loader: ImageLoader
     private let placeholder: Placeholder
     
     init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
         self.placeholder = placeholder()
         _loader = StateObject(wrappedValue: ImageLoader(url: url))
     }
     
     var body: some View {
         if let image = loader.image {
             Image(uiImage: image)
                 .resizable()
         } else {
             placeholder
         }
     }
 }

 class ImageLoader: ObservableObject {
     @Published var image: UIImage?
     
     private let url: URL
     private var cancellable: AnyCancellable?
     
     init(url: URL) {
         self.url = url
     }
     
     deinit {
         cancellable?.cancel()
     }
     
     func load() {
         cancellable = URLSession.shared.dataTaskPublisher(for: url)
             .map { UIImage(data: $0.data) }
             .replaceError(with: nil)
             .receive(on: DispatchQueue.main)
             .sink { [weak self] in self?.image = $0 }
     }
 }

 extension ImageLoader {
     static let placeholder = Image(systemName: "photo")
 }
 */
