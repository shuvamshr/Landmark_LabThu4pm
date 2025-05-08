//
//  MapView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 3/4/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject var viewModel: AttractionViewModel
    
    @State private var temperature = 0.0
    
    var body: some View {
        NavigationStack {
            Map {
                ForEach(viewModel.attractions) { attraction in
                    Annotation(attraction.name, coordinate: CLLocationCoordinate2D(latitude: attraction.latitude, longitude: attraction.longitude)) {
                        HStack {
                            Image(attraction.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                            Text(attraction.name)
                                .font(.headline)
                        }
                        .onTapGesture {
                            Task {
                                await getTemperature(latitude: attraction.latitude, longitude: attraction.longitude)
                            }
                        }
                        .padding(.all, 4)
                        .background(.white)
                    }
                }
            }
            .navigationTitle("Temperature: \(temperature)")
        }
    }
    
    func getTemperature(latitude: Double, longitude: Double) async {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=9f3fa86507527f4be46c0d5ffdb71490") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Check for error
            
            if let error = error {
                print("Some Error: \(error)")
                return
            }
            
            // Check if data exists
            
            guard let data = data else {
                print("No data exists")
                return
            }
            
            // Check if data matches model
            
            do {
                let weather: WeatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                print(weather.main.temp - 273.15)
                
                DispatchQueue.main.async {
                    temperature = weather.main.temp - 273.15
                }
            } catch {
                print("Data doesn't match model")
                return
            }
        }
        
        task.resume()
    }
}
