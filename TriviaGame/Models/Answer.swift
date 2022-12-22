//
//  Answer.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 16/12/2565 BE.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
