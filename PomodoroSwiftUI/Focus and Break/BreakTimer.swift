//
//  BreakTimer.swift
//  PomodoroSwiftUI
//
//  Created by Shahnaz EK on 07/08/22.
//

import SwiftUI
import AVFoundation

struct BreakTimer: View {
    
    @State var timerLabel = "05 : 00"
    @State var isTimerStarted = false
    @State var timer : Timer!
    @State var breakTime : Int = 300
    @State var fill : CGFloat = 0.0

    @State var player : AVAudioPlayer?

    var body: some View {
        
        ZStack {
            Color(red: 0.93, green: 0.77, blue: 0.74)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .center, spacing: 50, content: {
                
                
                ZStack {
                    
                    //Track Circle
                    Circle()
                        .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 15))
                    
                    //Animation Circle
                    Circle()
                        .trim(from: 0, to: self.fill) // stroke the circle 50% of the way. self.fill is the state that changes
                        .stroke(Color(red: 0.72, green: 0.20, blue: 0.22), style: StrokeStyle(lineWidth: 15))
                        .rotationEffect(.init(degrees: -90))
                        .animation(Animation.linear(duration: 0.5))
                    
                    
                    Text(timerLabel)
                        .font(.system(size: 90))
                        .foregroundColor(Color(red: 0.72, green: 0.20, blue: 0.22))
                        .multilineTextAlignment(.trailing)
                    
                }
                .padding(30)
                .frame(maxWidth: 500, maxHeight: 400)
                
                
                HStack(alignment: .center, spacing: 120, content: {
                    
                    Button(action: {
                        
                        timer.invalidate()
                        breakTime = 300
                        isTimerStarted = false
                        timerLabel = "05 : 00"
                        self.fill = 0.0
                        
                        
                    }, label: {
                        Image(systemName: "goforward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(red: 0.72, green: 0.20, blue: 0.22))
                    })

                    Button(action: {
                        
                        if !isTimerStarted {
                            startCounter()
                            isTimerStarted = true

                            
                        } else {
                            timer.invalidate()
                            isTimerStarted = false
                        }
                        
                    }, label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(red: 0.72, green: 0.20, blue: 0.22))
                    })
                    
                })
                
                
            })
            
        }
        
    }
    
    func startCounter() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
           
            breakTime -= 1
            self.fill += 0.003333
            timerLabel = formatCounter()
            
            if breakTime < 0 {
                playSound()
                timer.invalidate()
                isTimerStarted = false
                timerLabel = "05 : 00"
                breakTime = 300
                self.fill = 0.0

            }
        }
        
    }
        
    
    func formatCounter() -> String {
        
        let minutes = Int(breakTime) / 60 % 60
        let seconds = Int(breakTime) % 60
        return String(format : "%02i : %02i", minutes, seconds)
    }
    
    func playSound() {
        
        guard let url = Bundle.main.url(forResource: "TimerDone", withExtension: "mp3") else { return }

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
 

struct BreakTimer_Previews: PreviewProvider {
    static var previews: some View {
        BreakTimer()
    }
}
