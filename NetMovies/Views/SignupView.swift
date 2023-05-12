//
//  SignupScreen.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 03.05.23.
//

import SwiftUI

struct SignupView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var repassword: String = ""
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
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 390, height: 80)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .font(.system(size: 25, weight: .light, design: .serif))
                        .padding()
                        .keyboardType(.emailAddress)
                    
                    SecureField("Repeat password", text: $repassword)
                        .padding()
                        .frame(width: 390, height: 80)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .font(.system(size: 25, weight: .light, design: .serif))
                    
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty, !repassword.isEmpty else {
                            return
                        }
                        viewModel.creatUser(email: email, password: password, rePassword: repassword)
                    }) {
                        Text("Sign Up")
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

                    
                    NavigationLink(destination: LoginView()) {
                        Text("I have already an account? Sign In")
                            .font(.system(size: 20, weight: .heavy, design: .serif))
                            .foregroundColor(.white.opacity(0.6))
                            .underline()
                            .padding(.all, 20)
                    }
                    
                    
                }
            }
        }.preferredColorScheme(.dark)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().environmentObject(FirebaseViewModel())
    }
}
