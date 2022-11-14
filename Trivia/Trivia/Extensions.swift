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
            .shadow(radius: 15)
    }
}
