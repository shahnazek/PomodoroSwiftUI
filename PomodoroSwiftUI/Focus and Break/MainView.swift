//
//  MainView.swift
//  PomodoroSwiftUI
//
//  Created by Shahnaz EK on 09/08/22.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        
        NavigationView {
        
        ZStack {
            Color(red: 0.93, green: 0.77, blue: 0.74)
                .edgesIgnoringSafeArea(.all)
              
            VStack(alignment: .center, spacing: 80, content: {
                
                
                //CLOCK IMAGE
                         Image("pomodoroclock1")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 150, height: 150)
                             .clipShape(Circle())
                             .overlay {
                                 Circle().stroke(.black, lineWidth: 2)
                             }
                
                VStack(alignment: .center, spacing: 30, content: {
                    
            // FOCUS BUTTON
                    
                    Button(action: {
                        print("FOCUS Button Click")
                    }, label: {
                        NavigationLink(destination: FocusTimerView()) {
                             Label("FOCUS", systemImage: "book.fill")
                         }
                        .frame(width: 250.0, height: 60.0)
                        .foregroundColor(Color(red: 0.93, green: 0.77, blue: 0.74))
                        .font(.title)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 2)
                                .background(Color(red: 0.72, green: 0.20, blue: 0.22).cornerRadius(15))
                        )
                    })
                    
            // BREAK BUTTON
                    
                    Button(action: {
                        print("Break Button Click")
                    }, label: {
                        NavigationLink(destination: BreakTimer()) {
                             Label("BREAK", systemImage: "drop.fill")
                         }
                        .frame(width: 250.0, height: 60.0)
                        .foregroundColor(Color(red: 0.93, green: 0.77, blue: 0.74))
                        .font(.title)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 2)
                                .background(Color(red: 0.72, green: 0.20, blue: 0.22).cornerRadius(15))
                        )
                    })

                    
                    
            // SUPPORT BUTTON
            // remove the view from the support button pressed action. Add developer information in the new view
                    
                    Button(action: {
                        print("Support Button Click")
                    }, label: {
                        NavigationLink(destination: SupportTheDeveloper()) {
                             Label("SUPPORT", systemImage: "person.fill")
                         }
                        .frame(width: 250.0, height: 60.0)
                        .foregroundColor(Color(red: 0.93, green: 0.77, blue: 0.74))
                        .font(.title)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 2)
                                .background(Color(red: 0.72, green: 0.20, blue: 0.22).cornerRadius(15))
                        )
                    })
                    
                    
                    })
                
            })
            
                    
            }
            
        .navigationTitle("Focus")
        .font(.subheadline)
            
            // Restore for in app purchase
        .toolbar {
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Restore") {
                    // replace the below code with payment details. check udemy course
                    presentationMode.wrappedValue.dismiss()
                    
                }
                }
            
            }
            
            
        }
                
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
