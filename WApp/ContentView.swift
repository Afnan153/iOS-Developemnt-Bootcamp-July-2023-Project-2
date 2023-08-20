//
//  ContentView.swift
//  WApp
//
//  Created by afnan althobaiti on 03/02/1445 AH.
//

import SwiftUI


struct ContentView : View{
    
    @StateObject var service = WeatherService()
    @State private var  profileText = "Enter bio"
    
    @State var city: String = "Riyadh"
    
    @State var lat: String = ""
    @State var lon: String = ""
    
    
     var body: some View{
        VStack{
            ZStack{
                Rectangle().fill(.blue)
                    .frame(width: 300, height: 300)
                    .cornerRadius(19)
                
                
                VStack{
//                    AsyncImage(url:  URL(string: "https://openweathermap.org/img/wn/10d@2x.png"))
                    VStack {
                        TextField("City", text: $city)
                            .textFieldStyle(.roundedBorder)
                        TextField("Lat", text: $lat)
                            .textFieldStyle(.roundedBorder)
                        TextField("Lon", text: $lon)
                            .textFieldStyle(.roundedBorder)
                        
                        Button("Fetch") {
                            Task {
                                guard let coordinates = await service.coordinates(city: city) else { return }
                                lat = "\(coordinates.latitude)"
                                lon = "\(coordinates.longitude)"
                                await service.fetchCurrent(lat: coordinates.latitude, lon: coordinates.longitude)
                            }
                            
                        }
                        .buttonStyle(.borderedProminent)
                        
                        if let model = service.model {
                            Text(model.name)
                            Text("\(model.cod)")
                        }
                        
                    }
                    .padding()
                    .foregroundColor(.black)
                }
                
                
                
                
            }.font(.system(size:20))
                .foregroundColor(.white)
                .bold()
        }
        .alert(service.errorMessage, isPresented: $service.showingError) {
            Button("Continue", role: .cancel, action: {})
        }
    }
}











