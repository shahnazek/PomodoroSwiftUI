//
//  InfoView.swift
//  PomodoroSwiftUI
//
//  Created by Shahnaz EK on 08/08/22.
//

import SwiftUI

struct InfoView: View {
    
    let text : String
    let imageName : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color(.white))
            .frame(height: 45)
            .overlay(
                HStack {
                Image(systemName: imageName)
                        .foregroundColor(.green)
                        .font(.system(size: 25))
                Text(text)
        })
            .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
