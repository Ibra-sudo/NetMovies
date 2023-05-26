//
//  SearchTest.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 12.05.23.
//

import SwiftUI

struct Message: Identifiable, Codable {
    let id: Int
    var user: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct SearchTest: View {
    
    @GestureState var press = false
    @State var show = false
    
    var body: some View {
//        Image(systemName: "camera.fill")
//            .foregroundColor(.white)
//            .frame(width: 60, height: 60)
//            .background(show ? Color.black : Color.blue)
//            .mask(Circle())
//            .scaleEffect(press ? 2 : 1)
//            .animation(.spring(response: 0.4, dampingFraction: 0.6))
//            .gesture(LongPressGesture(minimumDuration: 0.5)
//                .updating($press) { currentState, gestureState, transaction in
//                    gestureState = currentState
//                }
//                .onEnded { value in
//                    show.toggle()
//                }
//            )
        VStack {
                    Text("Hello, SwiftUI!")
                        .padding()
                        .contextMenu {
                            Button(action: {
                                // Handle action 1
                                print("Action 1")
                            }) {
                                Label("Action 1", systemImage: "square.and.arrow.up")
                            }
                            
                            Button(action: {
                                // Handle action 2
                                print("Action 2")
                            }) {
                                Label("Action 2", systemImage: "trash")
                            }
                        }
                }
    }
   
}

struct SearchTest_Previews: PreviewProvider {
    static var previews: some View {
        SearchTest()
    }
}
