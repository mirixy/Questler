//
//  ResultView.swift
//  Cursed
//
//  Created by Miriam Renken on 08.12.23.
//

import Foundation
import SwiftUI

struct ResultView: View {
    var vm: QuizEngineVM
    var isCorrect: Bool
    var video: String?
    var body: some View {
        ZStack{
            LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()
            VStack{
                if isCorrect {
                    Text("Richtiiisch")
                        .onAppear{
                            SoundManager.instance.playSound(file: "bing")
                        }
                    
                } else {
                    
                    Text("Oh.... Mehr war einfach nicht drin")
                        .onAppear{
                            SoundManager.instance.playSound(file: "sad")
                        }
                }
                if vm.allDone(){
                    Text("Geschafft!")
                } else {
                    // Navigate back to the contentView
                    NavigationLink(destination: ContentView(vm: vm).onAppear{vm.nextQuestion()}) {
                        Text("Next")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .frame(width: 170, height: 50)
                            .background(.pink)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    if vm.get_video() == "" {
                        NavigationLink(destination: YouTubeView(vm: vm)) {
                            Text("Video")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .frame(width: 170, height: 50)
                                .background(.pink)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }.hidden()
                    } else {
                        NavigationLink(destination: YouTubeView(vm: vm)) {
                            Text("Video")
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



struct ResultView_Previews: PreviewProvider {
    static var previews: some View{
        ResultView(vm: QuizEngineVM(), isCorrect: false)
    }
}
