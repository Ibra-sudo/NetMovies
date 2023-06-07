//
//  HeaderView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 05.05.23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var toggleShowingHeaderImage: Bool
    @Binding var newImage: Image
    @StateObject var viewModel = ApiCaller()
    
    let model: MoviesModel
    var body: some View {
//        GeometryReader { geometry in
        NavigationStack{
            ZStack(alignment: .bottom) {
                
                if !toggleShowingHeaderImage {
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
                } else {
                    newImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 430, height: 500)
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
//                    ForEach(viewModel.images) { image in
//                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(image.poster_path ?? "")")) { image in
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 430, height: 450)
//            //                    .position(x: 215, y: 290)
//                                .clipped()
//                                .overlay(
//                                    LinearGradient(
//                                        gradient: Gradient(colors: [.clear, .black]),
//                                        startPoint: .top,
//                                        endPoint: .bottom
//                                    )
//            //                        .frame(height: geometry.size.height / 1.5)
//            //                        .clipped()
//                                    .opacity(0.8)
//            //                        .ignoresSafeArea(edges: .top)
//                                )
//
//                        } placeholder: {
//                            ProgressView()
//                        }
//                    }
                }
                HStack(spacing: 80) {
//                    Button( action: {
                    NavigationLink(destination: TrailerWebView(model: MoviesModel(title: model.title, tilteOverview: model.tilteOverview))){
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
//                    }) {
                        
//                    }
                    
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
        .onAppear{
//            viewModel.fetchImages(with: model.title)
//            print("view\(viewModel.images.count)")
        }
        
//            .frame(height: 700)
            
//        }
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(toggleShowingHeaderImage: .constant(false), newImage: .constant(Image("")), model: MoviesModel(title: "Spiderman", tilteOverview: "This is he most movie have ever to see!"))
    }
}

