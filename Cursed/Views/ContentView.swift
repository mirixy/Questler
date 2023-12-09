//
//  ContentView.swift
//  Cursed
//
//  Created by Miriam Renken on 08.12.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: QuizEngineVM
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(140), spacing: 10), count: 3)
    
    var body: some View {
        NavigationStack{
            ZStack {
                //background
                LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                
                //Questions
                VStack{
                    Text("Know you know, if you didn't know")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .padding()
                    Text(vm.model.quizModel.question)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding()
                    Image(vm.model.quizModel.questionImage)
                        .resizable()
                        .scaledToFit()
                    
                    // Answer Choices
                    LazyVGrid(columns: columns) {
                        ForEach(vm.model.quizModel.choiceList) { choice in
                            NavigationLink(destination: ResultView(vm: vm, isCorrect: choice.isCorrect)) {
                                Text("\(Image(systemName: choice.sysImage))\(choice.choiceText )")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .frame(width: 140, height: 40)
                                    .background(.pink)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    .safeAreaPadding(10)
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
