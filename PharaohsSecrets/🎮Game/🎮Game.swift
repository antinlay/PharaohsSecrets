//
//  🎮Game.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 23.07.2024.
//

import SwiftUI

enum WallPoints: Double {
    case first = 600
    case second = 1200
    case third = 1800
}

struct Game: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var score: Score
    
    @State var isPressing: Bool = false
    @State var isPause: Bool = false
    
    @State private var timer: Timer?
    @State private var offsetVertical: Double = 0

    
    private var tapToContinue: some View {
        VStack {
            Text("START!")
                .font(.leagueGothic(.regular, size: 123))
                .foregroundStyle(Color.actionGradient)
                .padding(.top, 50)
            Text("Tap to continue")
                .font(.cabin(.bold, size: 19))
                .foregroundStyle(.white)
        }
        .opacity(score.startGame ? .zero : 1)
        .onTapGesture {
            withAnimation {
                score.startGame = true
            }
            score.disableControl = false
        }
        
    }
    
    private var scoreboard: some View {
        Image(.Game.scoreboard)
            .overlay {
                Text("\(score.itemScore.coins)")
                    .font(.cabin(.bold, size: 31))
                    .foregroundStyle(.score)
            }
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    private var life: some View {
        HStack {
            ForEach(1..<4) { index in
                Image(.Game.life)
                    .opacity(index > score.itemScore.lives ? .zero : 1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .onChange(of: score.itemScore.lives) { newValue in
            if newValue == 0 {
                score.restart()
                router.navigate(to: .diedHistory)
            }
        }
    }
    
    private var pause: some View {
        Image(.Game.pause)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .onTapGesture {
                isPause = true
            }
    }
    
    private var treasuryStop: some View {
        TreasuryStop()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.bottom, 26)
            .padding(.trailing, 80)
            .offset(x: score.offset <= -4600 ? 0 : UIScreen.main.bounds.width)
            .opacity(score.offset <= -4600 ? 1 : .zero)
            .animation(.easeInOut(duration: 1.0), value: score.offset)
            .onChange(of: score.offset) { newValue in
                if newValue == -4602 {
                    score.disableControl = true
                }
            }
    }
    
    private var jumpButton: some View {
        ZStack {
            Text("""
            There seems to be something sparkling at
            the bottom.. I'll have to jump! I hope the
            parachute will help..
            """)
            .font(.cabin(.bold, size: 19))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 100)
            
            Image(.Game.redButton)
                .overlay {
                    Text("JUMP")
                        .font(.cabin(.medium, size: 15))
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    router.navigate(to: .parachute)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .padding(.trailing, 100)
                .padding(.top, 50)
        }
        .offset(x: score.offset <= -5300 ? 0 : UIScreen.main.bounds.width)
        .opacity(score.offset <= -5300 ? 1 : .zero)
        .animation(.easeInOut(duration: 1.0), value: score.offset)
        .onChange(of: score.offset) { newValue in
            if newValue == -5301 {
                score.disableControl = true
            }
        }
    }
    
    private func startAnimation() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            offsetVertical += 1
        }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    ArtefactsWall()
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: offsetVertical)
                        .task {
                            startAnimation()
                        }
                    Ground()
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .offset(x: score.offset >= 0 ? 0 : score.offset)
            }
            .scrollDisabled(true)
            .scrollIndicators(.never)
            .ignoresSafeArea()
            
            treasuryStop
            GeometryReader { geometryRunner in
                Runner(isPressing: $isPressing)
                    .position(x: 200, y: 265)
                    .onChange(of: score.offset) { _ in
                        let midX = geometryRunner.frame(in: .global).midX - 120
                        let midY = geometryRunner.frame(in: .global).midY
                        
                        score.runnerPoint = CGRect(x: midX, y: midY, width: 0, height: 80)
                    }
            }
            jumpButton
            scoreboard
                .padding(.top, 25)
            pause
                .sheet(isPresented: $isPause) {
                    Pause()
                }
                .padding(.trailing, 65)
                .padding(.top, 25)
            life
                .padding(.top, 30)
            Control(isPressingState: $isPressing)
            tapToContinue
        }
    }
}

#Preview {
    Game()
        .environmentObject(Score())
        .environmentObject(Router())
}
