//
//  MapView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 3/4/2025.
//

import SwiftUI

struct MapView: View {
    
    @EnvironmentObject var viewModel: AttractionViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                ForEach(viewModel.attractions) { attraction in
                    VStack(spacing: 8) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.largeTitle)
                            .foregroundStyle(.red)
                            
                        Text(attraction.name)
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.red)
                        
                    }
                    .offset(CGSize(width: attraction.xCord, height: attraction.yCord))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue.opacity(0.2))
            .navigationTitle("Map")
        }
    }
}
