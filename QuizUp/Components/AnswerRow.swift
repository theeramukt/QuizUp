//
//  AnswerRow.swift
//  QuizUp
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var answer: Answer
    @State private var isSelected = false
    
    var green = Color(red: 0.4, green: 0.8, blue: 0.4, opacity: 0.7)
    var red = Color(red: 0.8, green: 0.2, blue: 0.2, opacity: 0.7)
    var body: some View {
        HStack(spacing: 20) {
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color(.black))
        .background(isSelected ? answer.isCorrect ? green : red : Color("buttonRed"))
        .cornerRadius(10)
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
            .environmentObject(TriviaManager(categoryChild: ""))
    }
}
