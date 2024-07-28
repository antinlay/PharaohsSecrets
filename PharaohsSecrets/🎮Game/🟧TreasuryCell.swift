//
//  🟧TreasuryCell.swift
//  PharaohsSecrets
//
//  Created by Janiece Eleonour on 28.07.2024.
//

import SwiftUI

enum CellImage {
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
    var index: Int
    
    private var randomBox: CellImage {
        [.almaz, .bomb , .empty, .empty, .empty, .hryst, .pendant, .ring, .sansara, .triada].randomElement() ?? .empty
    }
    var body: some View {
        Image(randomBox.value)
    }
}

#Preview {
    TreasuryCell(index: 1)
}
