//
//  ContentView.swift
//  Cursed
//
//  Created by Miriam Renken on 08.12.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: QuizEngineVM
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 10), count: 2)
    
    var body: some View {
        NavigationStack{
            ZStack {
                //background
                LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                
                //Questions
                VStack{
                    Text("Humanizer")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .padding()
                    Text(vm.model.quizModel.question)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .padding()
                    Image(vm.model.quizModel.questionImage)
                        .resizable()
                        .scaledToFit()
                    
                    // Answer Choices
                    LazyVGrid(columns: columns) {
                        ForEach(vm.model.quizModel.choiceList) { choice in
                            NavigationLink(destination: ResultView(vm: vm, isCorrect: choice.isCorrect)) {
                                Text("\(Image(systemName: choice.sysImage))\(choice.choiceText )")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .frame(width: 170, height: 50)
                                    .background(.pink)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(vm: QuizEngineVM())
}
