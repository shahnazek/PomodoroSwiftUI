//
//  BreakTimer.swift
//  PomodoroSwiftUI
//
//  Created by Shahnaz EK on 07/08/22.
//

import SwiftUI

struct BreakTimer: View {
    
    @State var timerLabel = "05 : 00"
    @State var isTimerStarted = false
    @State var timer : Timer!
    @State var breakTime : Int = 300
  

    var body: some View {
        
        ZStack {
            Color(red: 0.93, green: 0.77, blue: 0.74)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 200, content: {
                
                
                Text(timerLabel)
                    .font(.system(size: 90))
                    .foregroundColor(Color(red: 0.72, green: 0.20, blue: 0.22))
                    .multilineTextAlignment(.trailing)
                
                HStack(alignment: .center, spacing: 120, content: {
                    
                    Button(action: {
                        
                        timer.invalidate()
                        breakTime = 300
                        isTimerStarted = false
                        timerLabel = "05 : 00"
                        
                        
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
            timerLabel = formatCounter()
            
            if breakTime < 0 {
                timer.invalidate()
                isTimerStarted = false
                timerLabel = "05 : 00"
                breakTime = 300
            }
        }
        
    }
        
    
    func formatCounter() -> String {
        
        let minutes = Int(breakTime) / 60 % 60
        let seconds = Int(breakTime) % 60
        return String(format : "%02i : %02i", minutes, seconds)
    }

}
 

struct BreakTimer_Previews: PreviewProvider {
    static var previews: some View {
        BreakTimer()
    }
}
