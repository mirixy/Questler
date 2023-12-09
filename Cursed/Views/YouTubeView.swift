//
//  YouTubeView.swift
//  Cursed
//
//  Created by Miriam Renken on 09.12.23.
//

import SwiftUI
import YouTubePlayerKit




struct YouTubeView: View {
    @ObservedObject var vm: QuizEngineVM
    let youTubePlayer = YouTubePlayer(source: .video(id: QuizEngineVM().get_video()),
                                     configuration: .init(
                                         autoPlay: true
                                     ))
    
    var body: some View {
        VStack{
            //let youTubePlayer: YouTubePlayer.Source? = .url(ur)
            //let videoSource: YouTubePlayer.Source = .video(id: ur)
            Text("VideoPlayer")
            YouTubePlayerView(self.youTubePlayer) { state in
                        // Overlay ViewBuilder closure to place an overlay View
                        // for the current `YouTubePlayer.State`
                        switch state {
                        case .idle:
                            ProgressView()
                        case .ready:
                            EmptyView()
                        case .error(_):
                            Text(verbatim: "YouTube player couldn't be loaded")
                        }
                
                
                    }
            
            NavigationLink(destination: ContentView(vm: vm).onAppear{vm.nextQuestion()}) {
                Text("Next")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(width: 170, height: 50)
                    .background(.pink)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
        
    }
}


#Preview {
    YouTubeView(vm: QuizEngineVM())
}
