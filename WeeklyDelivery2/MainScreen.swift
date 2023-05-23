//
//  MainScreen.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 18.05.2023.
//

import SwiftUI

struct MainScreen: View {
    
    @StateObject var db = ImmitationOfDB()
    @StateObject var user = User()
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SearchScreen()
                .environmentObject(db)
                .environmentObject(user)
                .tabItem {
                Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            BasketScreen()
                .environmentObject(user)
                .tabItem {
                Label("Main", systemImage: "basket")
                }
                .tag(2)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
