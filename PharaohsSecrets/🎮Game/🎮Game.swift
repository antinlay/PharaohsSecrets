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
    
    @State var runnerPoint = CGRect()
    @State var direction: Direction = .right
    
    @State var offset: Double = 0
    @State var isPressing: Bool = false
    @State var startGame: Bool = false
    
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
    }
    
    private var pause: some View {
        Image(.Game.pause)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .onTapGesture {
                router.navigate(to: .pause)
            }
    }
    
    private var treasuryStop: some View {
        TreasuryStop()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.bottom, 26)
            .padding(.trailing, 80)
            .offset(x: offset <= -4600 ? 0 : UIScreen.main.bounds.width)
            .opacity(offset <= -4600 ? 1 : .zero)
            .animation(.easeInOut(duration: 1.0), value: offset)
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
            .offset(x: offset <= -5300 ? 0 : UIScreen.main.bounds.width)
            .opacity(offset <= -5300 ? 1 : .zero)
            .animation(.easeInOut(duration: 1.0), value: offset)
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            ArtefactsWall(offsetHorizontal: $offset, runnerPoint: $runnerPoint)
            Ground(offset: $offset)
            treasuryStop
            GeometryReader { geometryRunner in
                ZStack {
                    Runner(isPressing: $isPressing, direction: $direction)
                        .position(x: 200, y: 265)
                        .onChange(of: offset) { _ in
                            let midX = geometryRunner.frame(in: .global).midX - 120
                            let midY = geometryRunner.frame(in: .global).midY
                            
                            runnerPoint = CGRect(x: midX, y: midY, width: 0, height: 80)
                        }
                }
            }
            jumpButton
            scoreboard
                .padding(.top, 25)
            pause
                .padding(.trailing, 65)
                .padding(.top, 25)
            life
                .padding(.top, 30)
            Control(isPressingState: $isPressing, offset: $offset, direction: $direction)
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
