//
//  ContentView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AttractionView()
                .tabItem {
                    Label("Attractions", systemImage: "star.fill")
                }
            Text("MapView()")
                .tabItem {
                    Label("Map", systemImage: "mappin.and.ellipse.circle.fill")
                }
            Text("SettingsView()")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
