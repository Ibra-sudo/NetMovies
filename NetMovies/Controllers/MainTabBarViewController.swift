//
//  MainTabBarViewController.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 04.05.23.
//

import SwiftUI

struct MainTabBarViewController: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem({
                        Text("Home")
                        Image(systemName: "house")
                    }).tag(0)
                UpcomingView()
                    .tabItem({
                        Text("Coming Soon")
                        Image(systemName: "play.circle")
                    }).tag(1)
                SearchView()
                    .tabItem({
                        Text("Top Search")
                        Image(systemName: "magnifyingglass")
                    }).tag(2)
                DownloadsView()
                    .tabItem({
                        Text("Downloads")
                        Image(systemName: "tray.and.arrow.down")
                    }).tag(3)
            }
            
        }.preferredColorScheme(.dark)
    }
}

struct MainTabBarViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarViewController()
    }
}
