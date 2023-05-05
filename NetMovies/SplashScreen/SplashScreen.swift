
import SwiftUI

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
                }
            }
        }.preferredColorScheme(.dark)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
