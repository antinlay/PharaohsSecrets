//
//  🥇YouWin.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 22.07.2024.
//

import SwiftUI

struct YouWin: View {
    @State private var treasure: ImageResource = .Treasury.triada
    @State private var points: Int = 122
    
    var body: some View {
        ZStack {
            fullScreenBackground(.YouWin.background)
            fullScreenBackground(.YouWin.flash)
            Image(.Pause.tablo)
                .scaleEffect(1.2)
                .padding(.top)
                .overlay(alignment: .top) {
                    Text("YOU WIN!")
                        .font(.leagueGothic(.regular, size: 89))
                        .foregroundStyle(Color.youWinGradient)
                        .padding()
                }
                .overlay(alignment: .bottom) {
                    VStack {
                        HStack {
                            Text("\(points)")
                                .font(.cabin(.bold, size: 63))
                                .foregroundStyle(.darkAccent)
                            Image(treasure)
                                .padding()
                        }
                        Text("You discovered new treasures!")
                            .font(.cabin(.bold, size: 19))
                            .foregroundStyle(.darkAccent)
                        Image(.YouWin.treasuryButton)

                    }
                }
        }
    }
}

#Preview {
    YouWin()
}
