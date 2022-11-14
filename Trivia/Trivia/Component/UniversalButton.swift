//
//  UniversalButton.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import SwiftUI

struct UniversalButton: View {
    
    var text: String // passed for our button
    var background: Color = Color("ButtonColor") // bg for button
    
    var body: some View {
        
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(40)
            .shadow(radius: 20)
            .font(.system(size: 20))
    }
}

struct UniversalButton_Previews: PreviewProvider {
    static var previews: some View {
        UniversalButton(text: "Next")
    }
}
