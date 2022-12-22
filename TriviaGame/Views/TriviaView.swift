//
//  TriviaView.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 17/12/2565 BE.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var tm: TriviaManager
    
    var body: some View {
        if tm.reachedEnd {
            VStack(spacing: 20) {
                header
                SettingsView()
                nextButton

                Spacer()

            }
            .foregroundColor(Color.accent)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                GradientBackground()
            )
            .toolbar(.hidden)
        } else {
            QuestionView()
            .onAppear {
                Task {
                    await tm.fetchTrivia()
                }
                   
            }
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}

extension TriviaView {
    
    private var header: some View {
        VStack(spacing: 20) {
            Text("Trivia Game")
                .modifiedTitle()
            Text("Congratulations, you have completed the game.")
            Text("You scored \(tm.score) out of \(tm.lenght)")
        }

    }
    
    private var nextButton: some View {
        Button {
            Task.init {
                await tm.fetchTrivia()
            }
        } label: {
            GeneralButton(text: "Play Again")
        }
    }
}
