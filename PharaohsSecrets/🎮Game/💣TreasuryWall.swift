//
//  💣TreasuryWall.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

enum AnimationPhase: Double, CaseIterable {
    case start = -450
    case end = 400
}

struct TreasuryWall: View {
    @Binding var offsetHorizontal: Double
    @State private var offsetVertical: Double = -450
    @State private var gridHeight: Double = 400
    @State private var randomBoxes: [ImageResource] = []
    
    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))], spacing: 10) {
                ForEach(randomBoxes.indices, id: \.self) { index in
                    
                    Image(randomBoxes[index])
                        .frame(width: 100, height: 100)
                }
            }
            .offset(y: offsetVertical)
            .offset(x: offsetHorizontal)
        }
        .ignoresSafeArea()
        .task {
            startAnimation()
        }
        Image(.Game.start)
    }
    
    private func startAnimation() {
        withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
            offsetVertical = gridHeight
        }
    }
}

#Preview {
    TreasuryWall(offsetHorizontal: .constant(0))
}
