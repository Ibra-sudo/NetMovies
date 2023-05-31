
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
                        .frame(width: 190, height: 190)
                        .cornerRadius(100)
                        .padding()
                    
                    Text("Net Movies")
                        .font(.system(size: 42, weight: .heavy, design: .serif))
                        .foregroundColor(.white)
                    
                    TextField("Email or phone number", text: $email)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .frame(width: 380, height: 65)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 380, height: 65)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .light, design: .serif))
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
                            .frame(width: 350, height: 30)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                            
                    }
                    .padding(.top, 20)
                    
//                    NavigationLink(
//                        destination: MainTabBarViewController(), isActive: $isSignedIn, label: { EmptyView() }
//                    )

                    NavigationLink(destination: SignupView()) {
                        Text("New to NetMovies? Sign up now.")
                            .font(.system(size: 20, weight: .heavy, design: .serif))
                            .foregroundColor(.white.opacity(0.6))
                            .underline()
                            .padding(.all, 20)
                    }
                    
                    Text("Sign in is protected by Google reCAPTCHA\n              to ensure you're not a bot.")
                        .padding(.init(.init(top: 0, leading: 10, bottom: 0, trailing: 10)))
                        .foregroundColor(.white.opacity(0.6))
                        .frame(width: 440)
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
