//
//  ContentView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 26.04.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var dataLoaded = false
    @StateObject var viewModel = FirebaseViewModel()
    
    var body: some View {
        VStack {
            if (dataLoaded) {
                if viewModel.signedIn {
                    MainTabBarViewController().environmentObject(viewModel)
                } else {
                    LoginView()
                        .environmentObject(viewModel)
                }
            } else {
                SplashScreen()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    dataLoaded = true
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
