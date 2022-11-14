//
//  SplashScreen.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import SwiftUI

struct SplashScreen: View {
    
    
    /*
     Tells wether splashscreen is active or not
     */
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var isRotated = false
    
    var animation: Animation {
        Animation.easeOut
    }
    
    let backgroundGradient = LinearGradient(
        colors: [Color("AccentColor"), Color("SecondaryAccentColor")],
        startPoint: .top, endPoint: .bottomTrailing)
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                backgroundGradient.ignoresSafeArea()
                VStack {
                    VStack {
//                        Text("Trivia Time!")
//                            .font(.system(size: 13))
//                            .fontWeight(.heavy)
//                            .foregroundColor(Color("ButtonColor").opacity(1.0))
                        
                        Image("TandJ")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(
                            Animation.easeInOut(duration: 0.7)
                                            .repeatCount(4, autoreverses: true)
                                ) {
                            self.size = 3.8
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
                        withAnimation(Animation.easeOut(duration: 0.3)) {
                            self.isActive = true
                        }
                        self.isActive = true
                    }
                }
            }
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
