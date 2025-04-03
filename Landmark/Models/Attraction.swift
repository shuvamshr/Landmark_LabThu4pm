//
//  Attraction.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI


struct Attraction: Identifiable {
    var id: UUID = UUID()
    var name: String
    var address: String
    var image: String = "default"
    var xCord: Double = 0.0
    var yCord: Double = 0.0
    // var coordinates: Coordinates = Coordinates(x: 0, y: 0)
}

struct Coordinates {
    var x: Double = 0.0
    var y: Double = 0.0
}
