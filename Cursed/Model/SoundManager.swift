//
//  SoundManager.swift
//  Cursed
//
//  Created by Miriam Renken on 08.12.23.
//

import Foundation
import AVKit
import SwiftUI

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound(file: String) {
        guard let url = Bundle.main.url(forResource: file, withExtension: ".mp3") else {return}
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("No File")
        }
    }
}


