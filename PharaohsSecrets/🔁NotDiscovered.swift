//
//  🔁NotDiscovered.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 23.07.2024.
//

import SwiftUI

struct NotDiscovered: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
                .scaleEffect(1.43)
                .blur(radius: 11, opaque: true)
            Image(.Pause.tablo)
                .scaleEffect(1.2)
                .padding(.top)
                .overlay(alignment: .top) {
                    VStack {
                        Text("""
                            You have not
                            discovered this
                            treasure yet!
                        """
                        )
                        .font(.cabin(.bold, size: 27))
                        .foregroundStyle(.accent)
                        .multilineTextAlignment(.center)
                        .padding()
                        Text("""
                                Go to the game and
                                collect treasures
                            """
                        )
                        .font(.cabin(.bold, size: 20))
                        .foregroundStyle(.darkAccent)
                        .multilineTextAlignment(.center)

                    }
                    .padding(.trailing, 22)
                }
                .overlay {
                }
                .overlay(alignment: .bottom) {
                    Button {
                        router.navigate(to: .menu)
                    } label: {
                        Image(.Game.button)
                    }
                }
        }
    }
}

#Preview {
    NotDiscovered()
        .environmentObject(Router())
}
