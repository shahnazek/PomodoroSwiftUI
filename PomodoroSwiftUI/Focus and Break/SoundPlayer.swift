//
//  Audio.swift
//  PomodoroSwiftUI
//
//  Created by Shahnaz EK on 30/08/22.
//

import Foundation
import AVFoundation
import SwiftUI

class SoundPlayer {
    
    @State var player : AVAudioPlayer?
    
    func playSound() {

        guard let url = Bundle.main.url(forResource: "Illuminate", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
