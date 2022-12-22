//
//  Extensions.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 18/12/2565 BE.
//

import SwiftUI

extension Color {
    
    static let accent = Color("AccentColor")
    static let selectedAnswer = Color("AccentColor")
    static let disabled = Color.gray
}

extension Text {
    func modifiedTitle() -> some View {
        self
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color.blue)
    }
}

extension View {
    func settingsLabels() -> some View {
        modifier(SettingsLabels())
    }
}

