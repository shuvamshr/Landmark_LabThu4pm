//
//  AttractionDetailView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI
import SkeletonUI

struct AttractionDetailView: View {
    
    var attraction: Attraction
    
    @State private var name = ""
    @State private var address = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Image(attraction.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                Text(name)
                    .font(.largeTitle)
                    .bold()
                    .skeleton(with: name.isEmpty, appearance: .solid(color: .red, background: .blue))
                    
                Text(address)
                    .foregroundStyle(.secondary)
                    .skeleton(with: address.isEmpty)
                    
                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                populateData()
            }
        }
    }
    
    private func populateData() {
        name = attraction.name
        address = attraction.address
    }
}

//#Preview {
//    AttractionDetailView()
//}
