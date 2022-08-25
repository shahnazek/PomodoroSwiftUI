//
//  SupportTheDeveloper.swift
//  PomodoroSwiftUI
//
//  Created by Shahnaz EK on 07/08/22.
//

import SwiftUI

struct SupportTheDeveloper: View {
    var body: some View {
        ZStack {
            Color(red: 0.95, green: 0.65, blue: 0.51)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Shahnaz1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200.0, height: 200.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Shahnaz Ek")
                    .font(.custom("Pacifico-Regular", size: 40))
                    .bold().foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .bold()
                Divider()
                InfoView(text: "ekshahnaz@gmail.com", imageName: "envelope.fill")
                InfoView(text: "Support the Developer", imageName: "dollarsign.circle.fill")
                }
                    
            }
    }
}

struct SupportTheDeveloper_Previews: PreviewProvider {
    static var previews: some View {
        SupportTheDeveloper()
    }
}
