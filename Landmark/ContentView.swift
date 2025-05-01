//
//  ContentView.swift
//  Landmark - Test
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = AttractionViewModel()
    
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Label("Map", systemImage: "mappin.and.ellipse.circle.fill")
                }
            AttractionView()
                .tabItem {
                    Label("Attractions", systemImage: "star.fill")
                }

            Text("SettingsView()")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
