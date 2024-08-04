//
//  😵Crashed.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 04.08.2024.
//

import SwiftUI

struct Crashed: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
                .grayscale(1)
                .brightness(-0.1)
            Image(.Game.dead)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            VStack {
                Text("Oh no.. I should have checked the\nparachute beforehand..")
                    .font(.cabin(.bold, size: 25))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                Text("Tap to continue")
                    .font(.cabin(.bold, size: 25))
                    .foregroundStyle(.white)
                    .opacity(0.6)
                    .onTapGesture {
                        router.navigate(to: .diedHistory)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            .padding(.top, 40)
            .padding(.trailing, 80)
        }
    }
}

#Preview {
    Crashed()
        .environmentObject(Router())
}
