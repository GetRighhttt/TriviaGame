//
//  Extensions.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import Foundation
import SwiftUI

extension Text {
    func universalTitle() -> some View {
        self.font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(Color("ButtonColor"))
    }
    
    func universalText() -> some View {
        self.foregroundColor(Color("ShadeGreenColor"))
            .fontWeight(.semibold)
            .font(.system(size: 20))
            .shadow(radius: 10)
    }
}

extension HStack {
    func universalHStack() -> some View {
        self.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color("ButtonColor"))
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
    }
}
