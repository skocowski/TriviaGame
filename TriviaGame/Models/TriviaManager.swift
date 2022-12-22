//
//  TriviaManager.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 17/12/2565 BE.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var lenght = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    @Published var numberOfQuestions = 10
    @Published var category = 0
    @Published var difficulty = "any"
    @Published var type = "any"

    func fetchTrivia() async {
        
        var cat: String {
            if category != 0 {
                return "&category=\(category + 8)"
            } else {
                return ""
            }
        }
        
        var diff: String {
            if difficulty != "any" {
                return "&difficulty=" + difficulty
            } else {
                return ""
            }
        }
        
        var kind: String {
            if type != "any" {
                return "&type=" + type
            } else {
                return ""
            }
        }
        
        let urlString = "https://opentdb.com/api.php?amount=\(numberOfQuestions)" + cat + diff + kind
        guard let url = URL(string: urlString) else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("Error while fetching data")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                self.trivia = decodedData.results
                self.lenght = self.trivia.count
                self.setQuestion()
            }
            
        } catch {
            print("Error fetching trivia \(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < lenght {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(lenght) * 350)
        
        if index < lenght {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
            
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
