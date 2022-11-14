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
                        Image("TandJ")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                        Text("")
                            .font(.system(size: 20))
                            .foregroundColor(Color("ButtonColor").opacity(1.0))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.8)) {
                            self.size = 3.4
                            self.opacity = 1.0
                        }
                    }
                    .animation(
                        Animation.easeInOut(duration: 1.5)
                                    .repeatCount(2, autoreverses: true)
                            )
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
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
