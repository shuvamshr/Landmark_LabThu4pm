//
//  AttractionViewModel.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 3/4/2025.
//

import SwiftUI

class AttractionViewModel: ObservableObject {
    @Published var attractions: [Attraction] = [
        Attraction(name: "Opera House", address: "Circular Quay", image: "operahouse", latitude: -33.8568, longitude: 151.2153),
        Attraction(name: "Darling Harbour", address: "Haymarket", image: "darlingharbour", latitude: -33.8731, longitude: 151.2006),
        Attraction(name: "Harbour Bridge", address: "Sydney", image: "harbourbridge", latitude: -33.8523, longitude: 151.2108)
    ]
    
//    @Published var visitCount: Int = UserDefaults.standard.integer(forKey: "CountVisit")
    
    @AppStorage("CountVist") var visitCount: Int = 0
    
    func addNewAttraction(attraction: Attraction) {
        let newAttraction = Attraction(name: attraction.name, address: attraction.address, image: attraction.image)
        
        attractions.append(newAttraction)
    }
    
    func addVisit() {
        visitCount += 1
        
        
//        UserDefaults.standard.set(visitCount, forKey: "CountVisit")
    }
}
