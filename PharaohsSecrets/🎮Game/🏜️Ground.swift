//
//  🏜️Ground.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 25.07.2024.
//

import SwiftUI

struct Ground: View {
    @Binding var offset: Double
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(0..<7, id: \.self) { index in
                    Image(.Game.ground)
                }
                Image(.Game.miniFire)
            }
            .offset(x: offset >= 0 ? 0 : offset)
            .animation(.linear(duration: 0.1), value: offset)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.linear, value: offset)
        .scrollDisabled(true)
    }
}

#Preview {
    Ground(offset: .constant(0))
}
