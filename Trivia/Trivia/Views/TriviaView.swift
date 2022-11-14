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
        QuestionView()
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
