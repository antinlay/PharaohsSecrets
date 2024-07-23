//
//  🎮Game.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 23.07.2024.
//

import SwiftUI

struct Game: View {
    private var startText: some View {
        Text("START!")
            .font(.leagueGothic(.regular, size: 123))
            .foregroundStyle(Color.actionGradient)
    }
    
    private var tapToContinue: some View {
        Text("Tap to continue")
            .font(.cabin(.bold, size: 19))
            .foregroundStyle(.white)
            .onTapGesture {
                // Переход на другое представление
            }
    }
    
    private var scoreboard: some View {
        Image(.Game.scoreboard)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 30)
        
    }
    
    private var life: some View {
        HStack {
            Image(.Game.life)
            Image(.Game.life)
            Image(.Game.life)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            scoreboard
            life
                .padding(.leading, 65)
                .padding(.top, 30)
            VStack {
                startText
                    .padding(.top, 50)
                tapToContinue
            }
            Image(.Game.ground)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    Game()
}
