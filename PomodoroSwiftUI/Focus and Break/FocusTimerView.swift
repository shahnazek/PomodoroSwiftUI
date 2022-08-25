//
//  FocusTimerView.swift
//  PomodoroSwiftUI
//
//  Created by Shahnaz EK on 06/08/22.
//

import SwiftUI

struct FocusTimerView: View {
    
    @State var timerLabel = "25 : 00"
    @State var timer : Timer!
    @State var isTimerStarted = false
    @State var focusTime : Int = 1500
    

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
                        focusTime = 1500
                        isTimerStarted = false
                        timerLabel = "25 : 00"
                        
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
           
            focusTime -= 1
            timerLabel = formatCounter()
            
            if focusTime < 0 {
                timer.invalidate()
                isTimerStarted = false
                timerLabel = "25 : 00"
                focusTime = 1500
            }
        }
        
    }
        
    
    func formatCounter() -> String {
        
        let minutes = Int(focusTime) / 60 % 60
        let seconds = Int(focusTime) % 60
        return String(format : "%02i : %02i", minutes, seconds)
    }
    
}

struct FocusTimerView_Previews: PreviewProvider {
    static var previews: some View {
        FocusTimerView()
    }
}
