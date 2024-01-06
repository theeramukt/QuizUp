//
//  PrimaryButton.swift
//  QuizUp
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    
    var body: some View {
        Text(text)
            .foregroundColor(.black)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
