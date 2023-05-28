//
//  DynamicProgress.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 28.05.23.
//

import Foundation
import SwiftUI


class DynamicProgress: NSObject, ObservableObject {
    
    @Published var isAdded: Bool = false
    @Published var hideStatusBar: Bool = false
    
    func addProgressView(config: ProgressConfig) {
        
        if rootController().view.viewWithTag(1009) == nil {
            let swiftUIView = DynamicProgressView(config: config)
                .environmentObject(self)
            let hostingView = UIHostingController(rootView: swiftUIView)
            hostingView.view.frame = screenSize()
            hostingView.view.backgroundColor = .clear
            hostingView.view.tag = 1009
            
            rootController().view.addSubview(hostingView.view)
            isAdded = true
        } else {
            print("Already Added")
        }
        
        
    }
    
    func updateProgressView(to: CGFloat) {
        
        NotificationCenter.default.post(name: NSNotification.Name("UPDATE_PROGRESS"), object: nil, userInfo: [
            "progress": to
        ])
    }
    
    func removeProgressView() {
        
        if let view = rootController().view.viewWithTag(1009) {
            view.removeFromSuperview()
            isAdded = false
            print("Removed from Root")
        }
    }
    
    func removeProgressWithAnimations() {
        
        NotificationCenter.default.post(name: NSNotification.Name("CLOSE_PROGRESS_VIEW"), object: nil)
    }
    
    func screenSize() -> CGRect {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds
    }
    
    func rootController() -> UIViewController {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = window.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}
