//
//  👑Treasury.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 22.07.2024.
//

import SwiftUI

struct Treasury: View {
    @State private var treasury: [ImageResource] = Array(repeating: .TreasuryView.placeholder, count: 10)
    var body: some View {
        ZStack {
            fullScreenBackground(.Histories.background)
                .scaleEffect(1.43)
                .blur(radius: 11, opaque: true)
            Image(.TreasuryView.backButton)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.top, 40)
            VStack {
                Text("Treasury")
                    .textCase(.uppercase)
                    .font(.leagueGothic(.regular, size: 56))
                    .foregroundStyle(Color.actionGradient)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top)
                
                LazyHGrid(rows: [GridItem(.fixed(100)), GridItem(.fixed(100))], spacing: 14) {
                    ForEach(treasury.indices, id: \.self) { trea in
                        Image(treasury[trea])
                    }
                }
                HStack {
                    Image(.TreasuryView.current)
                    Image(.TreasuryView.other)
                    Image(.TreasuryView.other)
                }
                .padding()
            }
        }
    }
}

#Preview {
    Treasury()
}
