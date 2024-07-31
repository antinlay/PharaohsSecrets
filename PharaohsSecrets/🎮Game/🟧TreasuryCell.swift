//
//  🟧TreasuryCell.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 28.07.2024.
//

import SwiftUI

enum CellImage: CaseIterable {
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

struct TreasuryCell: View {
    @Binding var runnerPoint: CGRect
    @State var randomBox = CellImage.allCases.randomElement() ?? .empty
    var index: Int
    @State var printTap = ""
    
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
                    randomBox = .empty
                }
            }
        }
    }
}

#Preview {
    TreasuryCell(runnerPoint: .constant(CGRect(x: 110, y: 110, width: 10, height: 10)), index: 1)
}
