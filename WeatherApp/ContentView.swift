//
//  ContentView.swift
//  WeatherApp
//
//  Created by Nidhi Chauhan on 09/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var isdayTime: Bool = true
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient:
                            Gradient(colors: [
                                isdayTime ? Color.blue : Color.black,
                                isdayTime ? Color("LightBlue") : Color.gray
                            ]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 80){
                Text("London")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                
                VStack(spacing: 4) {
                    Image(systemName: isdayTime ? "cloud.sun.rain.fill" : "moon.starts")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text("20")
                        .font(.system(size: 36))
                        .foregroundColor(.white )
                }
                
                HStack {
                    DayWeatherContainerView(dayname: "MON", imagename: "cloud.sun.fill", degreeTemp: 22)
                    
                    DayWeatherContainerView(dayname: "TUE", imagename: "sun.max.fill", degreeTemp: 33)
                    
                    DayWeatherContainerView(dayname: "WED", imagename: "wind.snow", degreeTemp: 8)
                    
                    DayWeatherContainerView(dayname: "THU", imagename: "sunset.fill", degreeTemp: 23)
                    
                    DayWeatherContainerView(dayname: "FRI", imagename: "cloud.sun.rain.fill", degreeTemp: 20)
                    
                    DayWeatherContainerView(dayname: "SAT", imagename: "snow", degreeTemp: 3)
                }
                
                Spacer()
                
                Button(action: {
                    print("Button tapped")
                    if isdayTime == true {
                        isdayTime = false
                    } else {
                        isdayTime = true
                    }
                }, label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DayWeatherContainerView: View {
    
    let dayname: String
    let imagename: String
    let degreeTemp: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayname)
                .font(.system(size: 24))
                .foregroundColor(.white)
            
            Image(systemName: imagename)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text("\(degreeTemp)")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
    }
}
