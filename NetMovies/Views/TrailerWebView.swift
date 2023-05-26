//
//  TrailerWebView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 23.05.23.
//

import SwiftUI
import WebKit

struct TrailerWebView: View {
    
    @StateObject var viewModel = ApiCaller()
    
    var model: MoviesModel
    
    var body: some View {
        VStack {
            WebView(videoId: "\(viewModel.youtubeTitle.id.videoId)")
                .frame(height: 300)
            Text(model.title)
                .font(.system(size: 22, weight: .bold))
                .padding(.top, 15)
            Text(model.tilteOverview)
                .font(.system(size: 18, weight: .regular))
                .padding(.top, 15)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
            
            Button(action: {
                // Download Button Action
            }) {
                Text("Download")
                    .foregroundColor(.white)
                    .frame(width: 140, height: 40)
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .padding(.top, 25)
            
            Spacer()
        }
        .onAppear{
            viewModel.getYoutubeMovie(with: model.title)
//            performBackgroundWork(WKWebView())
            print("videoIdView \(viewModel.youtubeTitle.id.videoId)")
        }
    }
}

struct WebView: UIViewRepresentable {
     
    let videoId: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
//        webView.navigationDelegate = context.coordinator
                
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        DispatchQueue.global().async {
//            guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else {return}
//            uiView.scrollView.isScrollEnabled = false
//            uiView.load(URLRequest(url: youtubeURL))
//            Thread.sleep(forTimeInterval: 1)
            
            
            DispatchQueue.main.async {
                guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else {return}
                uiView.scrollView.isScrollEnabled = false
                uiView.load(URLRequest(url: youtubeURL))
            }
        }
    }

}
//var videoId: String = ""
//func performBackgroundWork(_ uiView: WKWebView) {
//
//    DispatchQueue.global().async {
////        let videoId: String
//        Thread.sleep(forTimeInterval: 1)
//
//        DispatchQueue.main.async {
//
//            guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else {return}
//            uiView.scrollView.isScrollEnabled = false
//            uiView.load(URLRequest(url: youtubeURL))
//        }
//    }
//}
    


//https://youtube.com/watch?v=\(videoID)

struct TrailerWebView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerWebView(model: MoviesModel(title: "SupermanKids", tilteOverview: "This is the best movie ever to watch as a kid!"))
    }
}
