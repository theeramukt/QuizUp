//
//  QuestionView.swift
//  QuizUp
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @Environment(\.dismiss) private var dismiss
    
    let category: String
    let categoryIcon: String
    
    @State private var geometry: CGSize = .zero
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Image(categoryIcon)
                Text(category)
                    .bold()
                Spacer()
                Text("\(triviaManager.index + 1)/25")
                    .padding()
                    .background(Color("ScoreColor"))
                    .cornerRadius(15)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(Color("AccentColor"))
            .cornerRadius(15)
            
            GeometryReader { reader in
                VStack(alignment: .leading, spacing: 20) {
                    Text(triviaManager.question)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    ForEach(triviaManager.answerChoices, id: \.id) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(triviaManager)
                    }
                }
                .padding()
                .frame(height: reader.size.height * 1)
                .background(Color("AccentColor"))
                .cornerRadius(15)
                .onAppear {
                    geometry = reader.size
                }
            }
            
            HStack {
                if triviaManager.index == 0 {
                    Button {
                        dismiss()
                    } label: {
                        PrimaryButton(text: "Back", background: Color("buttonBlue"))
                    }
                }
                Spacer()
                Button {
                    triviaManager.goToNextQuestion()
                } label: {
                    PrimaryButton(text: "Next", background: triviaManager.answerSelected ? Color("buttonBlue") : Color("buttonGray"))
                }
                .padding(.bottom, 5)
                .disabled(!triviaManager.answerSelected)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(category: "" , categoryIcon: "")
            .environmentObject(TriviaManager(categoryChild: ""))
    }
}

