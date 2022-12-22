//
//  MainView.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 16/12/2565 BE.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var tm: TriviaManager
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                header
                SettingsView()
                
                NavigationLink {
                    TriviaView()
                } label: {
                    GeneralButton(text: "Let's go!")

                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .edgesIgnoringSafeArea(.bottom)
            .background(
                GradientBackground()
            )
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TriviaManager())
    }
}

extension MainView {
    
    private var header: some View {
        VStack(spacing: 20) {
            Text("Trivia Game")
                .modifiedTitle()
            
            Text("Test your knowledge!")
                .foregroundColor(Color.blue)
        }
    }
}

