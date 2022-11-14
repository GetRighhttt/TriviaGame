//
//  Trivia.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import Foundation

/*
 Created to format the trivia questions from the api in a logical way.
 
 Decodable means we can get json data and decode it into swift objects.
 serialization.
 */
struct TriviaData: Decodable {
    var results: [Result] // holds an array of our results.
    
    /*
     Result struct that can hold an id and can be serialized
     */
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID() // creates an istance of UUID.
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        /*
         Allows us to read symbols.
         */
        var formattedQuestion: AttributedString {
            // in Swift, we use do-catch instead of try-catch
            do {
                return try AttributedString(markdown: question)
            }catch {
                print("Error with format of question: \(error)")
                return ""
            }
        }
        
        /*
         Answer array which will allow us to centralize all the logic.
         */
        var answers: [Answer] {
            do {
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers = correct + incorrects
                
                // randomizes order of correct answers
                return allAnswers.shuffled()
                
                
            }catch {
                print("Error with answer format: \(error)")
                return []
            }
        }
    }
}
