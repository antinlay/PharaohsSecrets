//
//  🎲Menu.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI

struct Menu: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var score: Score

    private var pharaohe: some View {
        Image(.Menu.pharaohe)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding(.leading, 32)
            .ignoresSafeArea()
    }
    
    private var menu: some View {
        VStack {
            Image(.Menu.splash)
            Image(.Menu.startButton)
                .onTapGesture {
                    print(score.isFirstLaunch)
                    if score.isFirstLaunch {
                        router.navigate(to: .histories)
                    } else {
                        router.navigate(to: .game)
                    }
                }
            Image(.Menu.treasuryButton)
                .onTapGesture {
                    router.navigate(to: .treasury)
                }

        }
        .padding(.top, 44)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Menu.background)
            pharaohe
            menu
        }
    }
}

#Preview {
    Menu()
        .environmentObject(Router())
        .environmentObject(Score())
}
