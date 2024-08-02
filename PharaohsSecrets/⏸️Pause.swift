//
//  ⏸️Pause.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 18.07.2024.
//

import SwiftUI

struct Pause: View {
    @EnvironmentObject var router: Router
    
    private var pauseContent: some View {
        VStack(spacing: 0) {
            Text("Pause")
                .font(.cabin(.medium, size: 44))
                .foregroundStyle(.accent)
                .padding(.bottom, 10)
            Image(.Pause.restart)
                .onTapGesture {
                    router.navigate(to: .menu)
                }
            Image(.Pause.continue)
                .onTapGesture {
                    router.navigate(to: .game)
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
        .environmentObject(Score())
        .environmentObject(Router())
}
