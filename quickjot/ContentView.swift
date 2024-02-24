//
//  ContentView.swift
//  quickjot
//
//  Created by Fengji Zhang on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "person")
                    }
                ListView()
                    .tabItem {
                        Label("List", systemImage: "book")
                    }
            }
        }
}

#Preview {
    ContentView()
}
