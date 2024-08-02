//
//  🟧ArtefactCell.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 28.07.2024.
//

import SwiftUI

enum ArtefactImages: CaseIterable {
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

struct ArtefactCell: View {
    @EnvironmentObject var score: Score
    
    @Binding var runnerPoint: CGRect
    @State var randomBox = ArtefactImages.allCases.randomElement() ?? .empty
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
                    score.scoring(from: randomBox)
                    randomBox = .empty
                }
            }
        }
    }
}

extension Score {
    func scoring(from box: ArtefactImages) {
        switch box {
        case .bomb:
            itemScore.decrementLives()
        case .sansara:
            itemScore.keys = true
        case .ring:
            itemScore.incrementLives()
        case .triada:
            itemScore.coins += 1
        case .almaz:
            itemScore.weapons = true
        case .pendant:
            if itemScore.weapons {
                itemScore.weapons = false
            } else if itemScore.keys {
                itemScore.keys = false
            } else {
                itemScore.decrementLives()
            }
        case .hryst:
            itemScore.decrementLives()
        case .empty:
            return
        }
    }
}

#Preview {
    ArtefactCell(runnerPoint: .constant(CGRect(x: 110, y: 110, width: 10, height: 10)), index: 1)
        .environmentObject(Score())
}
