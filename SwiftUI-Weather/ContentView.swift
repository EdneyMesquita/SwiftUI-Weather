//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Edney Mesquita on 25/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack(spacing: 8) {
                CityTextView(cityName: "Sobral, CE")
                
                MainWheaterStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 36)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TER",
                                   imageName: "cloud.sun.fill",
                                   temperature: 36)
                    
                    WeatherDayView(dayOfWeek: "QUA",
                                   imageName: "sun.max.fill",
                                   temperature: 36)
                    
                    WeatherDayView(dayOfWeek: "QUI",
                                   imageName: "wind",
                                   temperature: 34)
                    
                    WeatherDayView(dayOfWeek: "SEX",
                                   imageName: "sunset.fill",
                                   temperature: 31)
                    
                    WeatherDayView(dayOfWeek: "SÁB",
                                   imageName: "cloud.rain.fill",
                                   temperature: 36)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Mode", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient.init(gradient: Gradient(colors: [
                                                isNight ? .black : .blue,
                                                isNight ? .gray : Color("lightBlue")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWheaterStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
