//
//  ContentView.swift
//  Pomodoro
//
//  Created by Rajesh Khuntia on 03/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
        VStack {
            countDownView()
            HStack{
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){ Image(systemName: "music.note").foregroundColor(.white)}
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){ Image(systemName: "slider.horizontal.3").foregroundColor(.white)}
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){ Image(systemName: "rectangle.landscape.rotate").foregroundColor(.white)}
                Spacer()
            }
            VStack{
                Text("Stay focused")
                Text("24.53").font(.title).padding(5)
                Text("Reading")
            }
            .frame(width: 300, height:300)
            //            .overlay(
            //                RoundedRectangle(cornerRadius: 500)
            //                    .stroke(Color.white, lineWidth: 3)
            //            )
            .border(Color.black)
            .padding(50)
            HStack{
                Spacer()
                Image(systemName: "play.fill")
                    .padding()
                    .background(.yellow)
                    .cornerRadius(200)
                Spacer()
                Image(systemName: "square.fill")
                    .foregroundColor(.yellow)
                    .padding()
                    .background(.gray)
                    .cornerRadius(200)
                Spacer()
            }
            
        }
        .padding()
    }
    }
}

#Preview {
    ContentView()
}
