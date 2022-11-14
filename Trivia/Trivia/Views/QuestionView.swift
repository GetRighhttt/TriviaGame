//
//  QuestionView.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing: 40) {
            
            // title hstack
            HStack {
                Text("Trivia Game")
                    .universalTitle()
                Spacer()
                Text("1 out of 10")
                    .foregroundColor(Color("ButtonColor"))
                    .fontWeight(.heavy)
            }
            
            // progress bar view
            ProgressBar(progress: 90)
            
            // display questions
            VStack(alignment: .leading, spacing: 20) {
                
                // Question
                Text("Which &quot;Toy Story&quot; character was voiced by Don Rickles?")
                    .universalText()
                
                // AnswerViews for right and wrong answers.
                AnswerView(answer: Answer(text: "Mr. Potato Head",
                                         isCorrect: true))
                AnswerView(answer: Answer(text: "Buzz Light Year",
                                         isCorrect: false))
            }
            
            UniversalButton(text: "Continue")
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AccentColor"))
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
