//
//  ❌TryAgain.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 22.07.2024.
//

import SwiftUI

struct TryAgain: View {
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
                .grayscale(1)
                .brightness(-0.1)
            VStack {
                Text("LOSE...")
                    .font(.leagueGothic(.regular, size: 123))
                    .foregroundStyle(Color.actionGradient)
                Text("Maybe check the equipment and try again?")
                    .font(.cabin(.bold, size: 25))
                    .foregroundStyle(.white)
                Image(.TryAgain.restart)
                    .onTapGesture {
                        // Заново
                    }
                Image(.TryAgain.main)
                    .onTapGesture {
                        // Главное меню
                    }
            }
        }
    }
}

#Preview {
    TryAgain()
}
