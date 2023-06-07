//
//  PlayView.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 05.05.23.
//

import SwiftUI

struct PlayView: View {
    
    @GestureState var press = false
    @State var show = false
    
    var body: some View {
        Text("Coming Soon!")
            .foregroundColor(show ? Color.white : Color.blue)
            .font(.largeTitle)
            .bold()
            .scaleEffect(press ? 2 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.3))
            .gesture(LongPressGesture(minimumDuration: 0.5)
                .updating($press) { currentState, gestureState, transaction in
                    gestureState = currentState
                }
                .onEnded { value in
                    show.toggle()
                }
            )
    }
    
    struct PlayView_Previews: PreviewProvider {
        static var previews: some View {
            PlayView()
        }
    }
}
