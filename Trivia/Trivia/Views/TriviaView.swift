//
//  TriviaView.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import SwiftUI

struct TriviaView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager

    
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Cartoon Trivia Finished!")
                    .universalTitle()
                
                Text("Congratulations! You've reached the end of the game!")
                    .universalText()
                
                Text("Score: \(triviaManager.score) out of \(triviaManager.length)")
                    .universalText()
                
                Button{
                    Task.init {
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    UniversalButton(text: "Try Again?")
                }
            }
            .foregroundColor(Color("ButtonColor"))
            .padding().frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("AccentColor"))
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
