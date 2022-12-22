//
//  ViewModifiersExt.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 18/12/2565 BE.
//

import SwiftUI

struct SettingsLabels: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(Color.black)
    }
}


struct GradientBackground: View {
    
    var body: some View {
        
        RadialGradient(
            gradient: Gradient(colors: [.yellow, .blue]),
            center: .top,
            startRadius: 10,
            endRadius: 400)
        .ignoresSafeArea()
    }
}
