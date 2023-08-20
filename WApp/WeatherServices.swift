//
//  WeatherServices.swift
//  WApp
//
//  Created by afnan althobaiti on 03/02/1445 AH.
//

import SwiftUI
import MapKit




class WeatherService: ObservableObject {
    
    let session : URLSession = .shared
    
    @AppStorage("city") var city: String?
    @Published public var model: Welcome?
    
    @Published public var errorMessage: String = ""
    @Published public var showingError: Bool = false
    
    @MainActor
    public func coordinates(city: String) async -> CLLocationCoordinate2D? {
        do {
            let placemarks = try await CLGeocoder().geocodeAddressString(city)
            return placemarks.first!.location!.coordinate
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    @MainActor
    public func fetchCurrent(lat: Double, lon: Double) async {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=")!
        
        var request = URLRequest(url: url)
        request.setValue("e58886539fcee5663c1638d0fbbd462e", forHTTPHeaderField: "x-api-key")
        
        do {
            let (data, response) = try await session.data(for: request)
            if let response = response as? HTTPURLResponse {
                // Response Handle
                print(response.statusCode)
            }
//            print(String(data: data, encoding: .utf8))
            let model = try JSONDecoder().decode(Welcome.self, from: data)
            self.model = model
        } catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
            showingError.toggle()
        }
//        let task = session.dataTask(with: requst) { (data, response, error)
//            in
//            if let error = error{
//                print("error",error)
//                return
//            }
//            if let data = data {
//
//                if let  content = String(bytes: data, encoding: .utf8){
//
//
//                    let decoder = JSONDecoder()
//
//                    do {
//                        let weatherData = try decoder.decode( Weather.self, from: data)
//
//                        dataModel = weatherData
//                       print(weatherData)
//
//                    } catch {
//                        print(error)
//
//                    }
//                }
//
//
//            }
//
//
//        }
//        task.resume()
    }
}
