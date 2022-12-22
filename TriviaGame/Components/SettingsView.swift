//
//  SettingsView.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 20/12/2565 BE.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    let constants = Constants()
    init() {
        // Segmented picker colours
        let uiSegmentedControl = UISegmentedControl.appearance()
        uiSegmentedControl.backgroundColor = .systemGray2
        uiSegmentedControl.selectedSegmentTintColor = .systemYellow
        uiSegmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        uiSegmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            
            Stepper(value: $triviaManager.numberOfQuestions, in: 0...30) {
                HStack {
                    Text("Questions")
                    Spacer()
                    Text("\(triviaManager.numberOfQuestions)")
                        .bold()
                    Spacer()
                }
            }
            
            HStack {
                Text("Category")
                Spacer()
                Picker("Category", selection: $triviaManager.category) {
                    
                    ForEach(Array(constants.categories.enumerated()), id: \.offset) { index, cat in
                        HStack {
                            Text(cat).tag(index+8)
                        }
                        .frame(width: 300)
                        .background(Color.red)
                    }
                }
            }
            
            HStack {
                Text("Difficulty")
                Spacer()
                Picker("Difficulty", selection: $triviaManager.difficulty) {
                    Text("Any").tag("any")
                    Text("Easy").tag("easy")
                    Text("Medium").tag("medium")
                    Text("Hard").tag("hard")
                }
            }
            
            HStack {
                Text("Type:")
                    .bold()
                
                Picker("Type", selection: $triviaManager.type) {
                    Text("Any").tag("any")
                    Text("Multiple").tag("multiple")
                    Text("Boolean").tag("boolean")
                }
                .pickerStyle(.segmented)
            }
        }
        .settingsLabels()
        .padding()
        .background(Color(.lightGray).opacity(0.5))
        .cornerRadius(10)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(TriviaManager())
    }
}
