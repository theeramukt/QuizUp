//
//  Extensions.swift
//  QuizUp
//

import Foundation

extension Categories {
    var getChild: String {
        switch self {
        case .Geography:
            return "22"
        case .Science:
            return "17"
        case .Computer:
            return "18"
        case .Art:
            return "25"
        }
    }
    var icon: String {
        switch self {
        case .Geography:
            return "geography"
        case .Science:
            return "science"
        case .Computer:
            return "computer"
        case .Art:
            return "art"
        }
    }
}
