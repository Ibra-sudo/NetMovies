//
//  ProfileView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 05.05.23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: FirebaseViewModel
    
    var body: some View {
        
        Button(action: {
            viewModel.signOut()
        }) {
            Text("Sign Out")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(width: 340, height: 30)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
                
        }
        .padding(.top, 30)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(FirebaseViewModel())
    }
}
