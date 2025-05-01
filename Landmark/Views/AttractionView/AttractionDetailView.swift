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
                    .skeleton(with: name.isEmpty)
                    .frame(width: 300, height: 40)
                    .font(.largeTitle)
                    .bold()
                Text(address)
                    .skeleton(with: address.isEmpty, shape: .rectangle)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.secondary)
                Spacer() 
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                name = attraction.name
                address = attraction.address
                           }
        }
    }
}

//#Preview {
//    AttractionDetailView()
//}
