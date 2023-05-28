
import SwiftUI
import SDWebImage

struct SplashScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack {
                    Image("NetMoviesLogo")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .cornerRadius(130)
                        .padding()
                    Text("Net Movies")
                        .bold()
                        .foregroundColor(.white)
                        .font(.custom("AmericanTypewriter", size: 40))
//                    AnimatedImage(url: getLogoURL())
//                    SDAnimatedImage(url: getLogoURL())
                }
            }
        }.preferredColorScheme(.dark)
    }
    
//    func getLogoURL() -> URL {
//        let bundle = Bundle.main.path(forResource: "NetMovies", ofType: "gif")
//        let url = URL(fileURLWithPath: bundle ?? "")
//        return url
//    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
