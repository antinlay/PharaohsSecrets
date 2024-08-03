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
    @State var startGame: Bool = false
    @State var isPause: Bool = false
    
    private var startText: some View {
        Text("START!")
            .opacity(startGame ? .zero : 1)
            .font(.leagueGothic(.regular, size: 123))
            .foregroundStyle(Color.actionGradient)
    }
    
    private var tapToContinue: some View {
        Text("Tap to continue")
            .font(.cabin(.bold, size: 19))
            .foregroundStyle(.white)
            .opacity(startGame ? .zero : 1)
            .onTapGesture {
                withAnimation {
                    startGame = true
                }
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
                if newValue == -4600 {
                    score.disableControl = true
                }
            }
    }
    
    private var jumpButton: some View {
        Image(.Game.redButton)
            .overlay {
                Text("JUMP")
                    .font(.cabin(.medium, size: 15))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            .padding(.trailing, 100)
            .padding(.top, 50)
            .offset(x: score.offset <= -5300 ? 0 : UIScreen.main.bounds.width)
            .opacity(score.offset <= -5300 ? 1 : .zero)
            .animation(.easeInOut(duration: 1.0), value: score.offset)
            .onChange(of: score.offset) { newValue in
                if newValue == -5300 {
                    score.disableControl = true
                }
            }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            ArtefactsWall()
            Ground()
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
            VStack {
                startText
                    .padding(.top, 50)
                tapToContinue
            }
        }
    }
}

#Preview {
    Game()
        .environmentObject(Score())
        .environmentObject(Router())
}
