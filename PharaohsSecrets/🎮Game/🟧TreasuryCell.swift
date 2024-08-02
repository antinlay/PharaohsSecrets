//
//  🟧TreasureCell.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 28.07.2024.
//

import SwiftUI

enum TreasureImages: CaseIterable {
    case almaz, bomb, empty, hryst, pendant, ring, sansara, triada
    
    var value: ImageResource {
        switch self {
        case .almaz:
                .Wall.almaz
        case .bomb:
                .Wall.bomb
        case .empty:
                .Wall.empty
        case .hryst:
                .Wall.hryst
        case .pendant:
                .Wall.pendant
        case .ring:
                .Wall.ring
        case .sansara:
                .Wall.sansara
        case .triada:
                .Wall.triada
        }
    }
}

struct TreasureCell: View {
    @EnvironmentObject var score: Score
    
    @Binding var runnerPoint: CGRect
    @State var randomBox = TreasureImages.allCases.randomElement() ?? .empty
    var index: Int
    @State var printTap = ""
    @State private var lastFrame: CGRect = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(randomBox.value)
                    .animation(.easeOut, value: randomBox)
                    .onTapGesture {
                        printTap = "x: \(geometry.frame(in: .global).midX)\ny: \(geometry.frame(in: .global).midY)"
                    }
                Text(printTap)
            }
            .onChange(of: geometry.frame(in: .global)) { newValue in
                if newValue.intersects(runnerPoint) {
                    switch randomBox {
                    case .bomb:
                        score.itemScore.lives -= 1
                    case .sansara:
                        score.itemScore.keys = true
                    case .ring:
                        score.itemScore.lives += 1
                    case .triada:
                        score.itemScore.coins += 1
                    case .almaz:
                        score.itemScore.weapons = true
                    case .pendant:
                        if score.itemScore.weapons {
                            score.itemScore.weapons = false
                        } else if score.itemScore.keys {
                            score.itemScore.keys = false
                        } else {
                            score.itemScore.lives -= 1
                        }
                    case .hryst:
                        score.itemScore.lives -= 1
                    case .empty:
                        return
                    }
                    if randomBox == .bomb {
                    }
                    randomBox = .empty
                }
            }
        }
    }
}

#Preview {
    TreasureCell(runnerPoint: .constant(CGRect(x: 110, y: 110, width: 10, height: 10)), index: 1)
        .environmentObject(Score())
}
