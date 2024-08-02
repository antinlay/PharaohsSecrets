//
//  🎁NewTreasure.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 02.08.2024.
//

import SwiftUI

struct NewTreasure: View {
    @State var treasureItem = TreasureItem()
    
    var body: some View {
        ZStack {
            Image(.NewTreasure.particles)
            Image(.Pause.tablo)
            VStack {
                Text("""
                    "You discovered
                     new treasure!
                    """)
                .font(.cabin(.medium, size: 22))
                .foregroundStyle(.accent)
                .multilineTextAlignment(.center)
                TreasureItemView(item: .constant(TreasureItem()))
                Image(.Pause.continue)
            }
        }
    }
}

#Preview {
    NewTreasure()
}
