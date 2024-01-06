//
//  ContentView.swift
//  QuizUp
//

import SwiftUI

struct ContentView: View {
    private var gridColumns = Array(repeating: GridItem(.flexible(), spacing: 30), count: 2)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Image("logo")
                
                LazyVGrid(columns: gridColumns, spacing: 35) {
                    ForEach(Categories.allCases, id: \.self) { category in
                        GeometryReader { geo in
                            NavigationLink {
                                TriviaView(category: category.rawValue, childCategory: category.getChild, categoryIcon: category.icon)
                                    .environmentObject(TriviaManager(categoryChild:  category.getChild))
                            } label: {
                                categoryItem(category, size: geo.size.width)
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
                .padding(50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("BackgroundColor"))
        }
        .navigationBarHidden(true)
    }
    
    private func categoryItem (_ category: Categories, size: Double) -> some View {
            VStack(alignment: .center, spacing: 10) {
                Image(category.icon)
                    .imageScale(.large)
                    .symbolRenderingMode(.palette)
                Text(category.rawValue)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .background(Color("AccentColor"))
            }
            .frame(width: size, height: size)
            .background(Color("AccentColor"))
            .cornerRadius(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
