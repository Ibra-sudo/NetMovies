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
                    
                    SecureField("   Repeat password", text: $repassword)
                        .frame(width: 390, height: 80)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .font(.system(size: 25, weight: .light, design: .serif))
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: 390, height: 60)
                        .overlay(
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        )
                        .padding(.all, 30)
                    
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
        SignupView()
    }
}
