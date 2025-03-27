//
//  AttractionView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct AttractionView: View {
    
    @State var attractions: [Attraction] = [
        Attraction(name: "Opera House", address: "Circular Quay", image: "operahouse"),
        Attraction(name: "Darling Harbour", address: "Haymarket", image: "darlingharbour"),
        Attraction(name: "Harbour Bridge", address: "Sydney", image: "harbourbridge")
    ]
    
    @State private var isNewAttractionSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(attractions) { attraction in
                    NavigationLink {
                        AttractionDetailView(attraction: attraction)
                    } label: {
                        AttractionListItem(attraction: attraction)
                    }
                }
            }
            .navigationTitle("Attractions")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isNewAttractionSheetShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isNewAttractionSheetShowing) {
                NewAttractionView(attractions: $attractions)
            }
        }
    }
    
}

#Preview {
    AttractionView()
}
