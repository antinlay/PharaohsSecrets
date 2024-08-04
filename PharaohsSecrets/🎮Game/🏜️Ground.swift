//
//  🏜️Ground.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

struct Ground: View {
    @EnvironmentObject var score: Score
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(0..<7, id: \.self) { index in
                    Image(.Game.ground)
                }
                Image(.Game.miniFire)
            }
            .offset(x: score.offset >= 0 ? 0 : score.offset)
            .animation(.linear(duration: 0.1), value: score.offset)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.linear, value: score.offset)
        .scrollDisabled(true)
    }
}

#Preview {
    Ground()
        .environmentObject(Score())
}
