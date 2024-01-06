//
//  TriviaView.swift
//  QuizUp
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @Environment(\.dismiss) private var dismiss
    
    let category: String
    let childCategory: String
    let categoryIcon: String
    
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Image("congratulationLogo")

                HStack {
                    Image(categoryIcon)
                    Text(category)
                }
                .padding(7)
                .frame(width: 190)
                .background(Color("AccentColor"))
                .cornerRadius(70)

                Text("Scored: \(triviaManager.score)")
                    .font(.title)
                    .bold()
                HStack(spacing: 35) {
                    Button {
                        Task.init {
                            try await triviaManager.fetchTrivia(category: childCategory)
                        }

                    } label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                    }
                    .frame(width: 75, height: 65)
                    .background(Color("buttonBlue"))
                    .cornerRadius(30)

                    Button {
                        dismiss()
                        Task.init {
                            try await triviaManager.fetchTrivia(category: childCategory)
                        }
                    } label: {
                        Image(systemName: "house.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                    .frame(width: 75, height: 65)
                    .background(Color("buttonBlue"))
                    .cornerRadius(30)
                }
            }
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
        } else {
            QuestionView(category: category, categoryIcon: categoryIcon)
                .environmentObject(triviaManager)
        }
    }
}
struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView(category: "", childCategory: "Test Category", categoryIcon: "Test Icon")
            .environmentObject(TriviaManager(categoryChild: ""))
    }
}
