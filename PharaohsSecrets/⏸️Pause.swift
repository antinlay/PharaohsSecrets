//
//  ⏸️Pause.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 18.07.2024.
//

import SwiftUI

struct Pause: View {
    private var pauseContent: some View {
        VStack(spacing: 0) {
            Text("Pause")
                .font(.cabin(.medium, size: 44))
                .foregroundStyle(.accent)
                .padding(.bottom, 10)
            Image(.Pause.restart)
                .onTapGesture {
                    // Заново начать игру
                }
            Image(.Pause.continue)
                .onTapGesture {
                    // Продолжить игру
                }
        }
    }
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Adventure.background)
            Image(.Pause.tablo)
                .padding(.top)
            pauseContent
        }
    }
}

#Preview {
    Pause()
}
