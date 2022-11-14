//
//  ContentView.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        @StateObject var triviaManager = TriviaManager()
        
        /*
         Need 2 vstacks to stack the views on top of eachother.
         */
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    
                    //title
                    Text("Trivia Game")
                        .universalTitle()
                    
                    // headline
                    Text("Let's see how good your trivia skills are!")
                        .font(.headline)
                        .foregroundColor(Color("ButtonColor"))
                }
                
                // start button
                NavigationLink {
                    TriviaView()
                    
                } label: {
                    UniversalButton(text: "Let's Begin!")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("AccentColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
