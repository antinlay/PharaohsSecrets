//
//  🎲Menu.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI

struct Menu: View {
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
            Image(.Menu.treasuryButton)
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
}
