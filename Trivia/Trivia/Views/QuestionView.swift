//
//  QuestionView.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var triviaManager: TriviaManager
    @State private var showDetail = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            // title hstack
            HStack {
                Text("Cartoon Trivia!")
                    .universalTitle()
                Spacer()
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .foregroundColor(Color("ButtonColor"))
                    .fontWeight(.heavy)
            }
            
            // progress bar view
            ProgressBar(progress: triviaManager.progress)
            
            // display questions
            VStack(alignment: .leading, spacing: 20) {
                
                // Question
                Text(triviaManager.question)
                    .universalText()
                
                // iterate through trivimanger answers and observe answer
                ForEach (triviaManager.answerChoices, id: \.id) { answer in
                    AnswerView(answer: answer)
                        .environmentObject(triviaManager)
                }
            }
            Button {
                triviaManager.navigateToNextQuestion()
            } label: {
                UniversalButton(text: "Continue", background: triviaManager.answerSelected ? Color("SecondaryAccentColor") : .gray)
            }
            .disabled(!triviaManager.answerSelected)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 3.0)) {
                    showDetail.toggle()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AccentColor"))
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
