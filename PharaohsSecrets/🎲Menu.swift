//
//  🎲Menu.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        ZStack {
            Image(.Menu.background)
                .resizable()
                .ignoresSafeArea()
            Image(.Menu.pharaohe)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding(.leading, 32)
                .ignoresSafeArea()
            VStack {
                Image(.Menu.splash)
                Image(.Menu.startButton)
                Image(.Menu.treasuryButton)
            }
            .padding(.top, 44)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
    }
}

#Preview {
    Menu()
}
