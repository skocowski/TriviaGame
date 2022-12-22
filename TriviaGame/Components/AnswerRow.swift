//
//  AnswerRow.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 16/12/2565 BE.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var answer: Answer
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "flame.fill")
                .font(.caption)
            
            HStack {
                Text(answer.text)
                    .bold()
                Spacer()
                
                
                if triviaManager.answerSelected {
                    if !isSelected && answer.isCorrect {
                        Text("Correct")
                            .foregroundColor(.green)
                            .bold()
                    }
                }
            }
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? .green : .red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color.selectedAnswer : Color.disabled) : Color.selectedAnswer)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : Color.disabled, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}
