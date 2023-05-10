
import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                    
                VStack {
                    
                    Image("Logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(100)
                        .padding()
                    
                    Text("Net Movies")
                        .font(.system(size: 50, weight: .heavy, design: .serif))
                        .foregroundColor(.white)
                    
                    TextField("   Email or phone number", text: $email)
                        .frame(width: 390, height: 80)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .font(.system(size: 25, weight: .light, design: .serif))
                    
                    SecureField("   Password", text: $password)
                        .frame(width: 390, height: 80)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .font(.system(size: 25, weight: .light, design: .serif))
                        .padding()
                    
                    NavigationLink(destination: MainTabBarViewController()) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2)
                            .frame(width: 390, height: 60)
                            .overlay(
                                Text("Sign In")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            )
                            .padding(.all, 30)
                    }
                    
                    NavigationLink(destination: SignupView()) {
                        Text("New to NetMovies? Sign up now.")
                            .font(.system(size: 20, weight: .heavy, design: .serif))
                            .foregroundColor(.white.opacity(0.6))
                            .underline()
                            .padding(.all, 30)
                    }
                    
                    Text("Sign in is protected by Google reCAPTCHA to ensure \n                              you're not a bot.")
                        .foregroundColor(.white.opacity(0.6))
                }
            }
        }.preferredColorScheme(.dark)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
