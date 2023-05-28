//
//  SearchTest.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 12.05.23.
//

import SwiftUI

//struct Message: Identifiable, Codable {
//    let id: Int
//    var user: String
//    var text: String
//}
//
//enum SearchScope: String, CaseIterable {
//    case inbox, favorites
//}

struct SearchTest: View {
    
//    @GestureState var press = false
//    @State var show = false
//    @State private var headerOffset: CGFloat = 0
//        @State private var isHeaderHidden = false
    @StateObject var progressBar: DynamicProgress = .init()
    @State var sampleProgress: CGFloat = 0
    
    var body: some View {
        
        Button("\(progressBar.isAdded ? "Stop" : "Start") Download") {
            if progressBar.isAdded {
                progressBar.removeProgressWithAnimations()
            } else {
                let config = ProgressConfig(title: "iJustine Image", progressImage: "arrow.up", expandedImage: "clock.badge.checkmark.fill", tint: .yellow, rotationEnabeld: true)
                progressBar.addProgressView(config: config)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, 100)
        .onReceive(Timer.publish(every: 0.01, on: .main, in: .default).autoconnect()) { _ in
            if progressBar.isAdded {
                sampleProgress += 0.3
                progressBar.updateProgressView(to: sampleProgress / 100)
            } else {
                sampleProgress = 0
            }
        }
        .statusBarHidden(progressBar.hideStatusBar)
        
//        DynamicProgressView()
//        VStack {
//                    GeometryReader { geometry in
//                        VStack {
//                            Text("Header")
//                                .font(.title)
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity)
//                                .frame(height: 100)
//                                .background(Color.blue)
//                                .offset(y: headerOffset)
//                                .gesture(headerDragGesture(geometry: geometry))
//                                .animation(.easeInOut)
//
//                            Spacer()
//                        }
//                    }
//
//                    Spacer()
//                }
//                .edgesIgnoringSafeArea(.all)
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
//        VStack {
//                    Text("Hello, SwiftUI!")
//                        .padding()
//                        .contextMenu {
//                            Button(action: {
//                                // Handle action 1
//                                print("Action 1")
//                            }) {
//                                Label("Action 1", systemImage: "square.and.arrow.up")
//                            }
//
//                            Button(action: {
//                                // Handle action 2
//                                print("Action 2")
//                            }) {
//                                Label("Action 2", systemImage: "trash")
//                            }
//                        }
//                }
    }
//    func headerDragGesture(geometry: GeometryProxy) -> some Gesture {
//            DragGesture()
//                .onChanged { value in
//                    let translation = value.translation.height
//
//                    // Limit header movement within its height
//                    let minY = -geometry.size.height
//                    let maxY: CGFloat = 0
//
//                    let newOffset = headerOffset + translation
//                    headerOffset = min(max(newOffset, minY), maxY)
//                }
//                .onEnded { value in
//                    let dragThreshold = geometry.size.height * 0.25
//
//                    if abs(value.translation.height) > dragThreshold {
//                        isHeaderHidden.toggle()
//                        headerOffset = isHeaderHidden ? -geometry.size.height : 0
//                    } else {
//                        headerOffset = isHeaderHidden ? -geometry.size.height : 0
//                    }
//                }
//        }
   
}

struct SearchTest_Previews: PreviewProvider {
    static var previews: some View {
        SearchTest()
    }
}

//struct DynamicProgressView: View {
//    
//    var config: ProgressConfig
//    @EnvironmentObject var progressBar: DynamicProgress
//    
//    @State var showProgressView: Bool = false
//    @State var progress: CGFloat = 0
//    @State var showAlertView: Bool = false
//    
//    var body: some View{
//        Canvas { ctx, size in
//            ctx.addFilter(.alphaThreshold(min: 0.5, color: .black))
//            ctx.addFilter(.blur(radius: 5.5))
//            
//            ctx.drawLayer { context in
//                for index in [1, 2] {
//                    if let resolvedImage = ctx.resolveSymbol(id: index) {
//                        context.draw(resolvedImage, at: CGPoint(x: size.width / 2, y: 11 + 18))
//                    }
//                }
//            }
//        } symbols: {
//            ProgressComponents()
//                .tag(1)
//            ProgressComponents(isCircle: true)
//                .tag(2)
//        }
//        .overlay(alignment: .top, content: {
//            ProgressView()
//                .offset(y: 11)
//        })
//        .overlay(alignment: .top, content: {
//            CustomAlertView()
//        })
//        .ignoresSafeArea()
//        .allowsHitTesting(false)
//        .onAppear{
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                showProgressView = true
//            }
//        }
//        .onReceive(NotificationCenter.default.publisher(for: .init("CLOSE_PROGRESS_VIEW")), perform: { _ in
//            showProgressView = false
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
//                progressBar.removeProgressView()
//            }
//        })
//        .onReceive(NotificationCenter.default.publisher(for: .init("UPDATE_PROGRESS"))) { output in
//            if let info = output.userInfo, let progress = info["progress"] as? CGFloat {
//                if progress < 1.0 {
//                    self.progress = progress
//                    
//                    if (progress * 100).rounded() == 100.0 {
//                        showProgressView = false
//                        showAlertView = true
//                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                            progressBar.hideStatusBar = true
//                        }
//                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                            showAlertView = false
//                            
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                                progressBar.hideStatusBar = false
//                            }
//                            
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
//                                progressBar.removeProgressView()
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    @ViewBuilder
//    func CustomAlertView() -> some View {
//        GeometryReader { proxy in
//            let size = proxy.size
//            
//            Capsule()
//                .fill(.black)
//                .frame(width: showAlertView ? size.width : 125, height: showAlertView ? size.height : 35)
//                .overlay(content: {
//                    HStack(spacing: 13) {
//                        Image(systemName: config.expandedImage)
//                            .symbolRenderingMode(.multicolor)
//                            .font(.largeTitle)
//                            .foregroundStyle(.white, .blue, .white)
//                        HStack(spacing: 6) {
//                            Text("Downloaded")
//                                .font(.system(size: 15))
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                            
//                            Text(config.title)
//                                .font(.system(size: 13))
//                                .fontWeight(.semibold)
//                                .foregroundColor(.gray)
//                        }
//                        .lineLimit(1)
//                        .contentTransition(.opacity)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .offset(y: 12)
//                    }
//                    .padding(.horizontal, 12)
//                    .blur(radius: showAlertView ? 0 : 5)
//                    .opacity(showAlertView ? 1 : 0)
//                })
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        }
//        .frame(height: 65)
//        .padding(.horizontal, 18)
//        .offset(y: 12)
//        .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7).delay(showAlertView ? 0.35 : 0), value: showAlertView)
//    }
//    
//    @ViewBuilder
//    func ProgressView() -> some View {
//        ZStack{
//            
//            let rotation = (progress > 1 ? 1 : (progress < 0 ? 0 : progress))
//            Image(systemName: config.progressImage)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 12, height: 12)
//                .fontWeight(.semibold)
//                .foregroundColor(config.tint)
//                .rotationEffect(.init(degrees: config.rotationEnabeld ? Double(rotation * 360) : 0 ))
//            
//            ZStack {
//                Circle()
//                    .stroke(.white.opacity(0.25), lineWidth: 4)
//                Circle()
//                    .trim(from: 0, to: progress)
//                    .stroke(config.tint, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
//                    .rotationEffect(.init(degrees: -90))
//            }
//            .frame(width: 23, height: 23)
//        }
//        .frame(width: 37, height: 37)
//        .frame(width: 126, alignment: .trailing)
//        .offset(x: showProgressView ? 45 : 0)
//        .opacity(showProgressView ? 1 : 0)
//        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: showProgressView)
//    }
//    
//    @ViewBuilder
//    func ProgressComponents(isCircle: Bool = false) -> some View {
//        if isCircle {
//            Circle()
//                .fill(.black)
//                .frame(width: 37, height: 37)
//                .frame(width: 126, alignment: .trailing)
//                .offset(x: showProgressView ? 45 : 0)
//                .scaleEffect(showProgressView ? 1 : 0.55, anchor: .trailing)
//                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: showProgressView)
//        } else {
//            Capsule()
//                .fill(.black)
//                .frame(width: 126, height: 36)
//                .offset(y: 1)
//        }
//    }
//}
