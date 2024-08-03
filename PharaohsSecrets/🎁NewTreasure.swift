//
//  🎁NewTreasure.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 02.08.2024.
//

import SwiftUI

struct NewTreasure: View {
    @Environment(\.dismiss) var dismiss
    @Binding var treasureItem: TreasureItem
    
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
            Image(.NewTreasure.lights)
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
                TreasureItemView(item: $treasureItem)
                Image(.Pause.continue)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    NewTreasure(treasureItem: .constant(TreasureItem()))
}
