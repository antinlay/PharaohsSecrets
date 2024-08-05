//
//  🏜️Ground.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

struct Ground: View {
    @EnvironmentObject var score: Score
    
    private var ground: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(0..<7, id: \.self) { index in
                Image(.Game.ground)
            }
            Image(.Game.miniFire)
        }
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ground
                .frame(maxHeight: .infinity, alignment: .bottom)
                .animation(.linear(duration: 0.1), value: score.offset)
                .offset(x: score.offset >= 0 ? 0 : score.offset)
                .animation(.linear, value: score.offset)
        }
        .ignoresSafeArea()
        .scrollDisabled(true)
    }
}

#Preview {
    Ground()
        .environmentObject(Score())
}
