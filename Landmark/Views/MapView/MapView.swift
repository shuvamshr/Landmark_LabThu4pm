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
    
    @State var temperature: Double = 0.0
    
    var body: some View {
        NavigationStack {
            Map {
                ForEach(viewModel.attractions) { attraction in
                    Annotation(attraction.name, coordinate: CLLocationCoordinate2D(latitude: attraction.latitude, longitude: attraction.longitude)) {
                        HStack(spacing: 16) {
                            Image(attraction.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(attraction.name)
                                    .font(.headline)
                                Text(attraction.address)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .onTapGesture {
                            Task {
                                await getWeather(latitude: attraction.latitude, longitude: attraction.longitude)
                            }
                        }
                        .padding()
                        .background(.white)
                        
                    }
                    .annotationTitles(.hidden)
                }
            }
            .navigationTitle("Temperature: \(temperature - 273.15)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func getWeather(latitude: Double, longitude: Double) async {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=9f3fa86507527f4be46c0d5ffdb71490") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Some error")
                return
            }
            
            guard let data = data else {
                print("No Data")
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                
                DispatchQueue.main.async {
                    temperature = weather.main.temp
                }
            } catch {
                print("Error")
            }
            
        }
        
        task.resume()
    }
}

/*
 
 Weather Data Sample:
 
 {
     "coord": {
         "lon": 151.2153,
         "lat": -33.8568
     },
     "weather": [
         {
             "id": 500,
             "main": "Rain",
             "description": "light rain",
             "icon": "10d"
         }
     ],
     "base": "stations",
     "main": {
         "temp": 291.18,
         "feels_like": 290.87,
         "temp_min": 290.04,
         "temp_max": 291.93,
         "pressure": 1026,
         "humidity": 70,
         "sea_level": 1026,
         "grnd_level": 1022
     },
     "visibility": 10000,
     "wind": {
         "speed": 1.79,
         "deg": 188,
         "gust": 5.36
     },
     "rain": {
         "1h": 0.49
     },
     "clouds": {
         "all": 76
     },
     "dt": 1746077112,
     "sys": {
         "type": 2,
         "id": 2018875,
         "country": "AU",
         "sunrise": 1746044965,
         "sunset": 1746083696
     },
     "timezone": 36000,
     "id": 2161251,
     "name": "Kirribilli",
     "cod": 200
 }
 
 
 
 
 
 */
