//
//  ContentView.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        
        /*
         Need 2 vstacks to stack the views on top of eachother.
         */
        NavigationView {
            ZStack{
                VStack(spacing: 40) {
                    VStack(spacing: 20) {
                        
                        //title
                        Text("Cartoon Trivia!")
                            .universalTitle()
                        
                        // headline
                        Text("Let's see how good your trivia skills are!")
                            .font(.headline)
                            .foregroundColor(Color("ButtonColor"))
                        
                        Image("TandJ")
                            .resizable()
                            .frame(width: 190.0, height: 160.0)
                            .foregroundColor(.white)
                            .cornerRadius(100)
                            .shadow(color: Color("ButtonColor"), radius: 20)
                    }
                    
                    // start button
                    NavigationLink {
                        TriviaView()
                            .environmentObject(triviaManager)
                        
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
