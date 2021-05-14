//
//  ContentView.swift
//  Rock-Paper-Scissors
//
//  Created by Gayan Kalinga on 5/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var gameOptions = ["Rock", "Paper", "Scissor"]
    @State private var userSelection = 0
    @State private var appSelection = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var showScore = false
    @State private var playCount = 0

    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .green, .gray]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all
                )
            VStack {
                Text(gameOptions[appSelection])
                    .padding()
                
                Text("\(shouldWin ? "User should win" : "User should loose")")
                Spacer()
                
                VStack{
                    HStack(spacing: 50){
                    
                        Button(action: {
                            print("Rock & \(String(shouldWin))")
                            
                            if shouldWin && appSelection == 1{
                                score += 1
                            }else if !shouldWin && appSelection == 2 {
                                score += 1
                            }else {
                                score -= 1
                            }
                            
                            playCount += 1
                            if playCount == 10{
                                showScore = true
                            }
                            
                            resetAppChoice()
                        }) {
                            Text("Rock")
                        }
                        
                        Button(action: {
                            print("Paper & \(String(shouldWin))")
                            
                            if shouldWin && appSelection == 0 || appSelection == 2{
                               score += 1
                            }else {
                                score -= 1
                            }
                            
                            playCount += 1
                            if playCount == 10{
                                showScore = true
                            }
                            
                            resetAppChoice()
                        }) {
                            Text("Paper")
                        }
                        
                        Button(action: {
                            print("Scissor & \(String(shouldWin))")
                            if !shouldWin && appSelection == 0 || appSelection == 1{
                                score += 1
                            }else {
                                score -= 1
                            }
                            playCount += 1
                            if playCount == 10{
                                showScore = true
                            }
                            resetAppChoice()
                        }) {
                            Text("Scissor")
                        }
                        
                    }

                }
                
                Spacer()
                Text("\(score)")
            }
            .alert(isPresented: $showScore){
                Alert(title: Text("Score"), message: Text("Your Score is \(score)"), dismissButton: .default(Text("Ok")){
                    self.startAgain()
                })
            }
        }
    }
    
    func startAgain(){
        print("calling \(score)")
        self.score = 0
        self.playCount = 0
        print("end \(score)")
        resetAppChoice()
    }
    
    
    func resetAppChoice(){
        appSelection = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
