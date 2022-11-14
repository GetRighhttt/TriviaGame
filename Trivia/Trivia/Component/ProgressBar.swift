//
//  ProgressBar.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import SwiftUI

struct ProgressBar: View {
    // numbers with decimals to show progress of questions
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            // entire progress bar
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(.white)
                .cornerRadius(20)
            
            // progress
            Rectangle()
                .frame(maxWidth: progress, maxHeight: 4)
                .foregroundColor(Color("ShadeGreenColor"))
                .cornerRadius(20)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        // starts progress at 50 in preview
        ProgressBar(progress: 80)
    }
}
