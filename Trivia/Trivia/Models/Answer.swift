//
//  Answer.swift
//  Trivia
//
//  Created by Stefan Bayne on 11/14/22.
//

import Foundation
import SwiftUI

/*
 Identifiable protocol means each answer can be uniquely identified.
 Basically can have it's own ID.
 */
struct Answer: Identifiable {
    var id = UUID() // generated by swift by each answer
    var text: AttributedString
    var isCorrect: Bool
}
