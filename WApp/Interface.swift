//
//  Interface.swift
//  WApp
//
//  Created by afnan althobaiti on 03/02/1445 AH.
//

import SwiftUI


struct InterfaceView: View {
 @State private var isNight: Bool = false
    var body: some View {
        
        ZStack{
       BackgroudView(isNight: $isNight)
            
            VStack{
                cityTextView(cityName: "Saudi Arabia")
                mainWeatherView(imageName: "cloud.sun.fill", temperature: 30)
                
                HStack (spacing: 25){
                    
//                    WeatherDayView(dayOfWeek: "MON", ImageName: "sunrise.fill", temperature: 27) //sub vista extraida para acortar codigo
//                    WeatherDayView(dayOfWeek: "TUE", ImageName: "cloud.fog.fill", temperature: 24) //sub vista extraida para acortar codigo
//                    WeatherDayView(dayOfWeek: "WED", ImageName: "cloud.bolt.fill", temperature: 20) //sub vista extraida para acortar codigo
//                    WeatherDayView(dayOfWeek: "THU", ImageName: "cloud.sun.fill", temperature: 29) //sub vista extraida para acortar codigo
//                    WeatherDayView(dayOfWeek: "FRI", ImageName: "sunrise.fill", temperature: 24) //sub vista extraida para acortar codigo
                    
                }// .padding()
                
            Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    weatherButton(title: " Light to Dark", textColor: .blue, bgColor: .white)
                    
                }

            Spacer()
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}      




struct WeatherDayView: View {
    
    var dayOfWeek : String
    var ImageName:String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
               //   .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text("\(temperature)")
                .foregroundColor(.white)
        }
    }
}

struct BackgroudView : View {
@Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct cityTextView: View{
    
    var cityName: String
    
    var body: some View{
        
               Text(cityName)
               .foregroundColor(.white)
               .font(.system(size: 32, weight: .medium, design: .default))
              .padding()
        
    }
}

struct mainWeatherView : View{
    
    var imageName: String
    var temperature : Int16
    
    var body: some View{
        
                VStack(spacing: 8){
                 Image(systemName: imageName)
                   .renderingMode(.original)
                    .resizable()
                     .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                   Text("\(temperature)°")
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .medium))
                    
                    
                }.padding(.bottom,40)
    }
}

struct weatherButton: View{
    
    var title: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View{
        
 Text(title)
 .frame(width: 280, height: 50)
  .background(bgColor)
 .foregroundColor(textColor)
      .cornerRadius(10)
   .font(.system(size: 20, weight: .medium))
        
    }
}
