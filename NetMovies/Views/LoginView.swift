
import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
//    @State private var isSignedIn: Bool = false
    @EnvironmentObject var viewModel: FirebaseViewModel
    
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
                    
                    TextField("Email or phone number", text: $email)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .frame(width: 390, height: 80)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .font(.system(size: 25, weight: .light, design: .serif))
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 390, height: 80)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .font(.system(size: 25, weight: .light, design: .serif))
                        .padding()
                    
//                    NavigationLink(destination: MainTabBarViewController()) {
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.gray, lineWidth: 2)
//                            .frame(width: 390, height: 60)
//                            .overlay(
//                                Text("Sign In")
//                                    .foregroundColor(.white)
//                                    .multilineTextAlignment(.center)
//                            )
//                            .padding(.all, 30)
//                    }
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
//                        self.isSignedIn = true
                    }) {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 360, height: 30)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                            
                    }
                    .padding(.top, 30)
                    
//                    NavigationLink(
//                        destination: MainTabBarViewController(), isActive: $isSignedIn, label: { EmptyView() }
//                    )

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
        LoginView().environmentObject(FirebaseViewModel())
    }
}
