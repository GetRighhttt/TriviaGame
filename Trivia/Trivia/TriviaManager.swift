//
//  TriviaManager.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import Foundation

/*
 Here is where we fetch data from the API.
 Observable oject is similar to LiveData in Android.
 
 Makes url request and converts snake case to camel case. Allows us to serialize data.
 */
class TriviaManager: ObservableObject {
    
    private(set) var trivia: [TriviaData.Result] = [] // array to save results from api
    @Published private(set) var length = 0
    
    /*
     Variables to update UI based off of api data.
     */
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    
    init () {
        Task.init {
            await fetchTrivia()
        }
    }
    
    /*
     we add async to make sure the HTTP requests happens asynchronously.
     */
    func fetchTrivia() async {
        // set base url
        guard let url = URL(string: "https://opentdb.com/api.php?amount=20&category=32&difficulty=medium")
        else {
            fatalError("Missing URL!")
        }
        
        // create url request
        let urlRequest = URLRequest(url: url)
        
        do {
            /*
             await data and response from url and make sure the status code is 200.
             */
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Errow fetching data.")}
            
            /*
             Convert snake to camel case.
             */
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            /*
             decode the data from the data model
             */
            let decodedData = try decoder.decode(TriviaData.self, from: data)
            
            /*
             Have to publish changes on the main thread.
             method called when we want to start trivia game again and see results.
             */
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
            
        } catch {
            print("Error return trivia data: \(error)")
        }
    }
    
    /*
     Method to go to next question
     */
    func navigateToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    /*
     Method to set the current question based on constraints.
     */
    func setQuestion () {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350) // calculate progess
        
        if index < length {
            let currentQuestion = trivia[index] // get current question
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answers
        }
    }
    
    /*
     Choose answer method.
     */
    func chooseAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    
}
