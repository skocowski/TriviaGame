//
//  QuestionView.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 16/12/2565 BE.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var tm: TriviaManager
    let constants = Constants()
    
    var body: some View {
        VStack(spacing: 40) {
            header
            ProgressBar(progress: tm.progress)
            questionAndAnswers
            nextButton

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            GradientBackground()
        )
        .toolbar(.hidden)
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}

extension QuestionView {
    
    private var header: some View {
        HStack {
            Text(constants.categories[tm.category])
                .modifiedTitle()
            
            
            Spacer()
            
            Text("\(tm.index + 1) out of \(tm.lenght)")
                .foregroundColor(Color.blue)
                .fontWeight(.heavy)

        }
    }
    
    private var questionAndAnswers: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(tm.question)
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color.black)
            
            ForEach(tm.answerChoices, id: \.id) { answer in
                AnswerRow(answer: answer)
            }
        }
    }
    
    private var nextButton: some View {
        Button {
            withAnimation {
                tm.goToNextQuestion()
            }
          
        } label: {
            GeneralButton(text: "Next", background: tm.answerSelected ? Color.yellow : Color(.lightGray))
        }
        .disabled(!tm.answerSelected)
    }
}

