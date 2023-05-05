//
//  ContentView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 26.04.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var dataLoaded = false
    
    var body: some View {
        
        
        VStack {
            if (dataLoaded) {
                LoginScreen()
            } else {
                SplashScreen()
            }
        }
        
        .onAppear {
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
