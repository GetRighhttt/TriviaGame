//
//  AnswerView.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import SwiftUI

struct AnswerView: View {
    @EnvironmentObject var triviaManager: TriviaManager

    
    // is the actual answer
    var answer: Answer
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    // to see which answer is selected
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            // if the answer is selected
            if isSelected {
                Spacer()
                
                // check & green for correct or x and red for wrong
                Image(systemName: answer.isCorrect ? "checkmark.circle" : "x.circle")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }// modify look based on selection and if wrong or not.
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor( isSelected ? Color("ButtonColor") : .gray)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red)
                : .gray, radius: 10, x: 0.5, y: 0.5)
        .onTapGesture {
            isSelected = true
        }
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(answer: Answer(text: "Yup.",
                                  isCorrect: false))
        .environmentObject(TriviaManager())
    }
}
