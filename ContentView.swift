//
//  ContentView.swift
//  photo-gen
//
//  Created by Dex on 28/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var night = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: night ? .black : .blue, bottomColor: night ? .gray : .white)
            mainView()
            VStack{
                Image(systemName: night ? "moon.stars.fill" : "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 140, height: 100)
                    .padding(.bottom, 600)
                Text("76°")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, -550)
            }
            Spacer()
            HStack{
                weatherView(dayOfWeek: "MON", imageIcon: "cloud.sun.fill", temp: 76)
                weatherView(dayOfWeek: "TUE", imageIcon: "cloud.rain.fill", temp: 66)
                weatherView(dayOfWeek: "WED", imageIcon: "wind", temp: 44)
                weatherView(dayOfWeek: "THU", imageIcon: "sunset.fill", temp: 45)
                
            }
            Spacer()
            VStack{
                Button{
                    night.toggle()
                } label: {
                    Text("Change Day")
                        .frame(width: 180, height: 50)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.top, 500)

                }
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct weatherView: View {
    var dayOfWeek: String
    var imageIcon: String
    var temp: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .padding(.top, 100)
            Image(systemName: imageIcon)
                .renderingMode(.original)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
        }
    }
}

struct mainView: View {
    var body: some View {
        VStack{
            Text("Auckland, NZ")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
                .padding(.top, -400)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
