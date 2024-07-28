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
    @Binding var score: Int
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
                Text("\(Int(offset))")
                    .font(.cabin(.bold, size: 31))
                    .foregroundStyle(.score)
            }
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    private var life: some View {
        HStack {
            Image(.Game.life)
            Image(.Game.life)
            Image(.Game.life)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    private var pause: some View {
        Image(.Game.pause)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .onTapGesture {
                //
            }
    }
        
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            TreasuryWall(offsetHorizontal: $offset)
                .offset(x: WallPoints.first.rawValue)
            TreasuryWall(offsetHorizontal: $offset)
                .offset(x: WallPoints.second.rawValue)
            TreasuryWall(offsetHorizontal: $offset)
                .offset(x: WallPoints.third.rawValue)
            Ground(offset: $offset)
            Runner(isPressing: $isPressing, direction: $direction)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding(.leading, 150)
                .padding(.bottom)
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
    Game(score: .constant(122))
}
